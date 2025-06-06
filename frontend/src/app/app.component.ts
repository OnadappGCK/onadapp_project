import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'onadapp';
  loading = true;
  ngOnInit() {
    // Simulate a minimum loading time
    setTimeout(() => {
      this.loading = false;
    }, 4000); // Durée minimale du chargement en millisecondes
  }
}
