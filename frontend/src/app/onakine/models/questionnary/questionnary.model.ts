/**
 * Questionnary by default is a succession of questions
 */

import { Question } from '../questions/question.model';

export class Questionnary {
  id?: number;
  questions: string = '';
  answers: Question[] = [
    {
      id: 1,
      label: 'Est opéré ?',
      answers: [
        { id: 1, label: 'oui' },
        { id: 2, label: 'non' },
      ],
      variable: 'operated',
      formType: 'simple',
    },
  ];

  /**
   * Model constructor
   */
  constructor() {}
}
