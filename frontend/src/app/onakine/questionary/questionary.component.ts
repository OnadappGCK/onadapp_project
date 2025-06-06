import { Component, OnInit } from '@angular/core';
import { QuestionService } from '../services/question/question.service';
import { Question } from '../models/questions/question.model';
import { IdLabel } from 'src/app/models/common/idLabel.model';
import { Result } from '../models/questions/result.model';

@Component({
  selector: 'app-questionary',
  templateUrl: './questionary.component.html',
  styleUrls: ['./questionary.component.scss'],
})
export class QuestionaryComponent implements OnInit {
  constructor(private questionservice: QuestionService) {}
  currentQuestion: Question = {
    id: 0,
    label: '',
    answers: [{ id: 0, label: '' }],
    variable: '',
    formType: '',
  };
  currentResult: Result = {
    id: 0,
    title: '',
    label: '',
    keyLetter: '',
    coeff: 0,
  };
  selectedAnswer: IdLabel = { id: 0, label: '' };
  showResult: boolean = false;

  ngOnInit() {
    this.questionservice.observeCurrentQuestion().subscribe((question) => {
      this.currentQuestion = question;
    });

    this.questionservice.observeCurrentResult().subscribe((result) => {
      this.currentResult = result;
    });

    this.questionservice.observeShowResult().subscribe((showResult) => {
      this.showResult = showResult;
    });

    this.questionservice.getQuestionFromCurrentAnswers();
  }

  handleSelectedAnswer(answer: IdLabel): void {
    this.selectedAnswer = answer;
  }

  public nextQuestion() {
    this.questionservice.addAnswer(this.selectedAnswer.id);
    this.questionservice.getQuestionFromCurrentAnswers();
  }
}
