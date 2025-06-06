import {
  Component,
  ElementRef,
  ViewChild,
  AfterViewInit,
  ChangeDetectorRef,
  Output,
  Input,
  EventEmitter,
} from '@angular/core';
import { CalendarService } from '../services/calendar.service';
import { Event } from '../models/event.model';

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.scss'],
})
export class CalendarComponent implements AfterViewInit {
  @ViewChild('calendarWrapper') calendarWrapperRef!: ElementRef;

  @Output() openDetails = new EventEmitter<Event[]>();
  @Input() events: Event[] = [];

  days: Date[] = [];
  hours: number[] = Array.from({ length: 17 }, (_, i) => i + 8); // 8h à minuit
  hourHeight = 0;

  constructor(
    private calendarService: CalendarService,
    private cdr: ChangeDetectorRef
  ) {
    this.days = this.getCurrentWeek();
  }

  ngAfterViewInit(): void {
    setTimeout(() => {
      const height = this.calendarWrapperRef.nativeElement.offsetHeight;
      this.hourHeight = height / this.hours.length;
      this.cdr.detectChanges();
    });
  }

  getCurrentWeek(): Date[] {
    const today = new Date();
    const startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - today.getDay() + 1); // Lundi

    return Array.from({ length: 7 }, (_, i) => {
      const d = new Date(startOfWeek);
      d.setDate(startOfWeek.getDate() + i);
      return d;
    });
  }

  getGroupedEventsForDay(day: Date): Event[][] {
    const events = this.calendarService.getEventsForDay(day);
    return events.map((e) => [e]); // Regroupement basique pour l'instant
  }

  onEventClick(events: Event[]): void {
    console.log('Event clicked:', events);
    this.openDetails.emit(events); // ou un groupe si besoin
  }
}
