import { Component } from '@angular/core';
import { Event } from './models/event.model';

@Component({
  selector: 'app-turquoise-evenement',
  templateUrl: './turquoise-evenement.component.html',
  styleUrls: ['./turquoise-evenement.component.scss'],
})
export class TurquoiseEvenementComponent {
  selectedEvents: Event[] = [];

  onOpenDetails(events: Event[]) {
    this.selectedEvents = events;
  }

  closeDetails() {
    this.selectedEvents = [];
  }
}
