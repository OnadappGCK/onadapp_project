// question.service.ts
import { Injectable } from '@nestjs/common';
import { Pool } from 'pg';

@Injectable()
export class QuestionService {
  constructor(private readonly pool: Pool) {}

  async findNextQuestionsAndAnswers(idList: number[]): Promise<any[]> {
    const query = `
    SELECT DISTINCT q.id as question_id, q.label as question_label, qa.id as answer_id, qa.label as answer_label
    FROM public.question q
        LEFT JOIN public.question_answer qa ON q.id = qa.id_question
        LEFT JOIN public.operation_param op ON qa.id = op.id_question_answer
        WHERE op.id_operation IN (
          SELECT op.id_operation
          FROM public.operation_param op
          WHERE op.id_question_answer = ANY($1)
          GROUP BY op.id_operation
          HAVING COUNT(DISTINCT op.id_question_answer) = $2
        )
        AND q.id NOT IN (
          SELECT qa.id_question
          FROM public.question_answer qa
          WHERE qa.id = ANY($1)
        )
    `;

    const result = await this.pool.query(query, [idList, idList.length]);

    const questionsMap = new Map();
    result.rows.forEach((row) => {
      if (!questionsMap.has(row.question_id)) {
        questionsMap.set(row.question_id, {
          id: row.question_id,
          label: row.question_label,
          answers: [],
        });
      }
      questionsMap.get(row.question_id).answers.push({
        id: row.answer_id,
        label: row.answer_label,
      });
    });

    return Array.from(questionsMap.values()).filter(
      (item) => item.answers.length >= 2,
    );
  }

  async findResults(idList: number[]): Promise<any[]> {
    const query = `
      SELECT DISTINCT o.id as id, o.title as title, o.label as label, o.key_letter as key_letter, o.coeff as coeff
      FROM public.operation o
      LEFT JOIN public.operation_param op ON o.id = op.id_operation
      WHERE op.id_operation IN (
        SELECT op.id_operation
        FROM public.operation_param op
        WHERE op.id_question_answer = ANY($1)
        GROUP BY op.id_operation
        HAVING COUNT(DISTINCT op.id_question_answer) = $2
      )
      ORDER BY o.id
    `;

    const result = await this.pool.query(query, [idList, idList.length]);

    const operationsMap = new Map();
    result.rows.forEach((row) => {
      if (!operationsMap.has(row.id)) {
        // Correction ici pour utiliser row.id
        operationsMap.set(row.id, {
          id: row.id,
          title: row.title,
          label: row.label,
          keyLetter: row.key_letter,
          coeff: row.coeff,
        });
      }
    });

    return Array.from(operationsMap.values());
  }

  async findFirstQuestionsAndAnswers(): Promise<any[]> {
    const query = `
      SELECT DISTINCT q.id as question_id, q.label as question_label, qa.id as answer_id, qa.label as answer_label
      FROM public.question q
      LEFT JOIN public.question_answer qa ON q.id = qa.id_question
      LEFT JOIN public.operation_param op ON qa.id = op.id_question_answer
      ORDER BY q.id, qa.id
    `;

    const result = await this.pool.query(query);

    const questionsMap = new Map();
    result.rows.forEach((row) => {
      if (!questionsMap.has(row.question_id)) {
        questionsMap.set(row.question_id, {
          id: row.question_id,
          label: row.question_label,
          answers: [],
        });
      }
      questionsMap.get(row.question_id).answers.push({
        id: row.answer_id,
        label: row.answer_label,
      });
    });

    return Array.from(questionsMap.values());
  }
}
