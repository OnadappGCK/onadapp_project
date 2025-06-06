import { Component } from '@angular/core';
import { QuestionService } from './services/question/question.service';
import { Question } from './models/questions/question.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-onakine',
  templateUrl: './onakine.component.html',
  styleUrls: ['./onakine.component.scss'],
})
export class OnakineComponent {
  constructor(
    private questionservice: QuestionService,
    private router: Router
  ) {}

  goQuestionnary() {
    this.router.navigate(['onakine/questions']);
  }
}
