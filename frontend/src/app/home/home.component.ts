import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApplicationLight } from '../models/application/appli-light.model';
import { fadeInAnimation } from '../common/animations/animation';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  animations: [fadeInAnimation],
})
export class HomeComponent {
  isVisible = 'hidden';

  applications: ApplicationLight[] = [
    {
      id: 1,
      name: 'onakine',
      img: 'assets/img/applications/onakine/onakine.png',
    },
  ];
  constructor(private route: ActivatedRoute, private router: Router) {}

  goToOnakine() {
    this.navigate('onakine');
  }

  goToTurquoise() {
    this.navigate('turquoise');
  }

  navigate(path: string) {
    this.router.navigate([path]);
  }

  onVisibleChange(isVisible: Event) {
    this.isVisible = isVisible ? 'visible' : 'hidden';
  }
}
