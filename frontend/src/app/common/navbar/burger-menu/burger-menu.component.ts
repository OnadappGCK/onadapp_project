import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'burger-menu',
  template: `
    <div class="burger-menu" [class.active]="active" (click)="onBurgerClicked()">
      <div class="burger-container">
        <div class="burger-inner"></div>
      </div>
    </div>
  
  `,
  styleUrls: ['burger-menu.component.scss']
})
export class BurgerMenuComponent implements OnInit {
  @Input() init: boolean = false;
  @Output() opened = new EventEmitter<any>();

  active = false;

  ngOnInit() {
    this.active = this.init || false;
  }

  onBurgerClicked() {
    this.active = !this.active;
    this.opened.emit();
  }
}

