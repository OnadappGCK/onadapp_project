import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Question } from '../../models/questions/question.model';
import { IdLabel } from 'src/app/models/common/idLabel.model';
import { QuestionService } from '../../services/question/question.service';

@Component({
  selector: 'app-body-form',
  templateUrl: './body-form.component.html',
  styleUrls: ['./body-form.component.scss'],
})
export class BodyFormComponent {
  constructor(private questionservice: QuestionService) {}

  selectedAnswer: IdLabel = { id: 0, label: '' };

  @Input() question: Question = {
    id: 1,
    label: 'Est opéré ?',
    answers: [
      { id: 1, label: 'oui' },
      { id: 2, label: 'non' },
    ],
    variable: 'operated',
    formType: 'simple',
  };

  selectAnswer(answer: IdLabel): void {
    this.selectedAnswer = answer;
    this.questionservice.addAnswer(this.selectedAnswer.id);
    this.questionservice.getQuestionFromCurrentAnswers();
  }
}
