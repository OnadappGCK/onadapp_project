import { Component, Input, HostBinding, OnChanges } from '@angular/core';
import { Event } from '../models/event.model';

@Component({
  selector: 'app-event-block',
  templateUrl: './event-block.component.html',
  styleUrls: ['./event-block.component.scss'],
})
export class EventBlockComponent implements OnChanges {
  @Input() events: Event[] = [];

  @HostBinding('style.top') top = '0px';
  @HostBinding('style.height') height = '0px';

  readonly startHour = 8;
  readonly endHour = 24;

  ngOnChanges(): void {
    if (this.events.length === 0) return;

    // Heure de début minimale du groupe
    const minStart = Math.min(
      ...this.events.map((e) => this.parseHour(e.timeStart))
    );
    const maxEnd = Math.max(
      ...this.events.map((e) => this.parseHour(e.timeEnd || e.timeStart))
    );

    // Hauteur d'une heure = 1/16 de la zone (car 16h)
    const hourHeight = 100 / (this.endHour - this.startHour); // en %

    const startOffset = (minStart - this.startHour) * hourHeight;
    const blockHeight = (maxEnd - minStart) * hourHeight;

    this.top = `${startOffset}%`;
    this.height = `${blockHeight}%`;
  }

  parseHour(time: string): number {
    const [hours, minutes] = time.split(':').map(Number);
    return hours + (minutes || 0) / 60;
  }
}
