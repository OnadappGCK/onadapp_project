import { Component, EventEmitter, Input, Output } from '@angular/core';
import { IdLabel } from 'src/app/models/common/idLabel.model';
import { Question } from '../../models/questions/question.model';
import { faCoffee } from '@fortawesome/free-solid-svg-icons';
import { faCheckCircle } from '@fortawesome/free-solid-svg-icons';
import { faXmarkCircle } from '@fortawesome/free-solid-svg-icons';
import { QuestionService } from '../../services/question/question.service';

@Component({
  selector: 'app-dual-form',
  templateUrl: './dual-form.component.html',
  styleUrls: ['./dual-form.component.scss'],
})
export class DualFormComponent {
  constructor(private questionservice: QuestionService) {}

  gradientColorLeft = '#76cf7d'; // initialisation avec une nouvelle valeur
  gradientColorRight = '#ee4d4d'; // initialisation avec une nouvelle valeur

  faCoffee = faCoffee;
  faCheckCircle = faCheckCircle;
  faXmarkCircle = faXmarkCircle;

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
