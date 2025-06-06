import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CarouselCustomComponent } from './carousel-custom.component';

describe('CarouselCustomComponent', () => {
  let component: CarouselCustomComponent;
  let fixture: ComponentFixture<CarouselCustomComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CarouselCustomComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(CarouselCustomComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
