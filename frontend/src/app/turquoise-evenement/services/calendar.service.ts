import { Injectable } from '@angular/core';
import { Event } from '../models/event.model';

@Injectable({ providedIn: 'root' })
export class CalendarService {
  private events: Event[] = [
    {
      id: 1,
      title: 'Concert Jazz',
      date: '2025-06-04',
      timeStart: '12:00',
      timeEnd: '16:00',
      place: 'Théâtre',
      city: 'Lyon',
      description: 'Soirée musicale.',
      type: 'CONCERT',
      iconId: 1,
    },
    {
      id: 2,
      title: 'Feu d’artifice',
      date: '2025-06-04',
      timeStart: '22:00',
      timeEnd: '23:00',
      place: 'Parc',
      city: 'Lyon',
      description: 'Spectacle pyrotechnique.',
      type: 'FEU_ARTIFICE',
      iconId: 2,
    },
  ];

  getEventsForDay(day: Date): Event[] {
    return this.events.filter((event) => {
      return new Date(event.date).toDateString() === day.toDateString();
    });
  }
}
