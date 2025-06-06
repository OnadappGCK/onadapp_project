import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TurquoiseEvenementComponent } from './turquoise-evenement.component';

describe('TurquoiseEvenementComponent', () => {
  let component: TurquoiseEvenementComponent;
  let fixture: ComponentFixture<TurquoiseEvenementComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TurquoiseEvenementComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TurquoiseEvenementComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
