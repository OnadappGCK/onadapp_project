import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NoConnexionComponent } from './no-connexion.component';

describe('NoConnexionComponent', () => {
  let component: NoConnexionComponent;
  let fixture: ComponentFixture<NoConnexionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NoConnexionComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NoConnexionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
