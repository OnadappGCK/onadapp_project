import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { QuestionDataService } from '../client/question-data.service';
import { Question } from '../../models/questions/question.model';
import { Result } from '../../models/questions/result.model';

@Injectable({
  providedIn: 'root',
})
export class QuestionService {
  constructor(private questionDataService: QuestionDataService) {}

  readyToAnswer: boolean = false;

  currentAnswerIdList: number[] = [];
  /*currentAnswerIdListBehaviour = new BehaviorSubject<number[]>(
    this.currentAnswerIdList
  );*/
  currentQuestion: Question = {
    id: 0,
    label: '',
    answers: [],
    variable: '',
    formType: '',
  };
  currentQuestionBehaviour = new BehaviorSubject<Question>(
    this.currentQuestion
  );
  showResult: boolean = false;
  showResultBehaviour = new BehaviorSubject<boolean>(this.showResult);
  currentResult: Result = {
    id: 0,
    title: 'NO RESULT',
    label: 'No result',
    keyLetter: 'ERROR',
    coeff: 0,
  };
  currentResultBehaviour = new BehaviorSubject<Result>(this.currentResult);

  reloadQuestionnary() {
    this.currentAnswerIdList = [];
    this.currentResult = {
      id: 0,
      title: 'NO RESULT',
      label: 'No result',
      keyLetter: 'ERROR',
      coeff: 0,
    }; //WIP faire un defaut result stocke qqpart
    this.currentResultBehaviour.next(this.currentResult);
    this.showResult = false;
    this.showResultBehaviour.next(false);
    this.getQuestionFromCurrentAnswers();
  }

  getQuestions(idList: number[]): Observable<Question[]> {
    return this.questionDataService.getQuestions(idList);
  }

  getQuestionFromCurrentAnswers(): void {
    this.questionDataService.getQuestions(this.currentAnswerIdList).subscribe({
      next: (data) => {
        if (data.length > 0 && data[0].answers.length > 1) {
          this.currentQuestion = data[0];
          this.readyToAnswer = true;
          this.currentQuestionBehaviour.next(this.currentQuestion);
        } else {
          this.getResultFromCurrentAnswers();
        }
      },
      error: (error) => {
        console.error('Erreur lors de la récupération des questions', error);
      },
    });
  }

  getResultFromCurrentAnswers(): void {
    this.questionDataService.getAnswer(this.currentAnswerIdList).subscribe({
      next: (data) => {
        this.showResult = true;
        this.showResultBehaviour.next(true);
        if (data && data.length > 0) this.currentResult = data[0];
        this.currentResultBehaviour.next(this.currentResult);
      },
      error: (error) => {
        console.error('Erreur lors de la récupération du resultat', error);
      },
    });
  }

  observeCurrentResult(): Observable<Result> {
    return this.currentResultBehaviour.asObservable();
  }

  observeCurrentQuestion(): Observable<Question> {
    return this.currentQuestionBehaviour.asObservable();
  }

  observeShowResult(): Observable<boolean> {
    return this.showResultBehaviour.asObservable();
  }

  addAnswer(id: number) {
    if (id != 0 && this.readyToAnswer)
      this.currentAnswerIdList = this.currentAnswerIdList.concat(id);
    //this.currentAnswerIdListBehaviour.next(this.currentAnswerIdList);
    this.readyToAnswer = false;
  }
}
