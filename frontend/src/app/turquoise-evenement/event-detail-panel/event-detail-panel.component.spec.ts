import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EventDetailPanelComponent } from './event-detail-panel.component';

describe('EventDetailPanelComponent', () => {
  let component: EventDetailPanelComponent;
  let fixture: ComponentFixture<EventDetailPanelComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EventDetailPanelComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EventDetailPanelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
