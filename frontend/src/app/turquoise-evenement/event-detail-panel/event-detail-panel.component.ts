import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Event } from '../models/event.model';

@Component({
  selector: 'app-event-detail-panel',
  templateUrl: './event-detail-panel.component.html',
  styleUrls: ['./event-detail-panel.component.scss'],
})
export class EventDetailPanelComponent {
  @Input() events: Event[] = [];
  @Output() closePanel = new EventEmitter<void>();
}
