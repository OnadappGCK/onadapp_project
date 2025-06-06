import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OnakineComponent } from './onakine.component';

describe('OnakineComponent', () => {
  let component: OnakineComponent;
  let fixture: ComponentFixture<OnakineComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [OnakineComponent]
    });
    fixture = TestBed.createComponent(OnakineComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
