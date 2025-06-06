import { Component } from '@angular/core';

@Component({
  selector: 'app-loading-screen',
  templateUrl: './loading-screen.component.html',
  styleUrl: './loading-screen.component.scss',
})
export class LoadingScreenComponent {
  text: string = 'ONADAPP';
  displayedText: string = '';

  ngOnInit() {
    this.typewrite();
  }

  typewrite() {
    let index = 0;
    const speed = 250; // Vitesse d'animation en ms

    const typingEffect = () => {
      if (index < this.text.length) {
        this.displayedText += this.text.charAt(index);
        index++;
        setTimeout(typingEffect, speed);
      }
    };

    typingEffect();
  }
}
