import { Component, Input } from '@angular/core';
import { Result } from '../../models/questions/result.model';
import { faArrowRotateBack } from '@fortawesome/free-solid-svg-icons';
import { QuestionService } from '../../services/question/question.service';

@Component({
  selector: 'app-answer',
  templateUrl: './answer.component.html',
  styleUrls: ['./answer.component.scss'],
})
export class AnswerComponent {
  constructor(private questionservice: QuestionService) {}

  faArrowRotateBack = faArrowRotateBack;
  @Input() result: Result = {
    id: 1,
    title: 'NO RESULT FOUND',
    label: 'echec de la requete',
    keyLetter: 'ERROR',
    coeff: 0,
  };

  reloadQuestionnary() {
    this.questionservice.reloadQuestionnary();
  }
}
