import { Component } from '@angular/core';
import { environment } from 'src/app/environments/environment.prod';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
})
export class FooterComponent {
  name: String = environment.applicationName;
}
