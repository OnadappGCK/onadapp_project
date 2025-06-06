import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common'; // ← Important
import { EventBlockComponent } from './event-block/event-block.component';
import { EventDetailPanelComponent } from './event-detail-panel/event-detail-panel.component';
import { CalendarComponent } from './calendar/calendar.component';
import { TurquoiseEvenementComponent } from './turquoise-evenement.component';

@NgModule({
  declarations: [
    EventBlockComponent,
    EventDetailPanelComponent,
    CalendarComponent,
    TurquoiseEvenementComponent,
  ],
  imports: [
    CommonModule, // ← Doit être présent pour ngStyle, ngIf, ngFor, etc.
  ],
  exports: [TurquoiseEvenementComponent],
})
export class CalendarModule {}
