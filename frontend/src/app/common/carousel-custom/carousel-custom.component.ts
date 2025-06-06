// carousel.component.ts
import { Component } from '@angular/core';
import {
  trigger,
  state,
  style,
  transition,
  animate,
} from '@angular/animations';
import { Router } from '@angular/router';

interface CarouselItem {
  logo: string;
  title: string;
  text: string;
  pageLink: string;
  backgroundImage: string;
}

@Component({
  selector: 'app-carousel-custom',
  templateUrl: './carousel-custom.component.html',
  styleUrls: ['./carousel-custom.component.scss'],
  animations: [
    trigger('slideInOut', [
      state('left', style({ transform: 'translateX(0)' })),
      state('right', style({ transform: 'translateX(0)' })),
      transition('* => left', [
        style({ transform: 'translateX(100%)' }),
        animate('300ms ease-in-out'),
      ]),
      transition('* => right', [
        style({ transform: 'translateX(-100%)' }),
        animate('300ms ease-in-out'),
      ]),
    ]),
    trigger('fadeInOut', [
      state('visible', style({ opacity: 1 })),
      state('hidden', style({ opacity: 0 })),
      transition('visible => hidden', animate('500ms ease-out')),
      transition('hidden => visible', animate('500ms ease-in')),
    ]),
  ],
})
export class CarouselCustomComponent {
  constructor(private router: Router) {}
  items: CarouselItem[] = [
    {
      logo: 'assets/img/applications/onakine/onakine2.png',
      title: 'Onakine',
      text: 'Application pour aider les kinésithérapeutes dans le chiffrement de leur actes, Onakine est un veritable gagne-temps pour les professionnels de santé',
      backgroundImage: 'assets/img/applications/onakine/background.jpg',
      pageLink: 'onakine',
    },
    {
      logo: 'assets/img/applications/turquoise/turquoise2.png',
      title: 'Turquoise Evenement',
      text: "La conciergerie turquoise de la côte bleue propose aujourd'hui un service de calendrier partagé à la pointe grâce à l'application de Turquoise Evenement fournie par onadapp !",
      backgroundImage: 'assets/img/applications/turquoise/background.png',
      pageLink: '',
    },
    {
      logo: 'assets/img/applications/artgorithme/artgorithme2.png',
      title: 'Artgorithme',
      text: "Utiliser l'outil informatique jusqu'à ses limites ne pourrait-il pas être une forme d'art ? Sur Artgorithme nous pensons que le code et ses limites sont l'outil parfait pour créer des choses originales, venez jeter un coup d'oeil !",
      backgroundImage: 'assets/img/applications/artgorithme/background.jpg',
      pageLink: '',
    },
    {
      logo: 'assets/img/applications/onatest/onatest2.png',
      title: 'Onatest',
      text: "Dites moi ce que vous mangez, je vous direz qui vous êtes, fonctionne aussi avec la race de votre chien et la marque de votre cafetière, Onatest c'est une sorte de mentalisme avancé par algorithme",
      backgroundImage: 'assets/img/applications/onatest/background.jpg',
      pageLink: '',
    },
    {
      logo: 'assets/img/applications/onadai/onadai2.png',
      title: 'Onadai',
      text: "L'utilisation de l'intelligence artificielle est un vrai défi du siècle, sur onadai voilà l'ia spécifique de onadapp avec toute ses documentations",
      backgroundImage: 'assets/img/applications/onadai/background.png',
      pageLink: '',
    },
  ];

  currentIndex = 0;
  previousIndex = 0;
  animationDirection: 'left' | 'right' = 'left';
  backgroundState1: 'visible' | 'hidden' = 'visible';
  backgroundState2: 'visible' | 'hidden' = 'hidden';
  isAnimating = false;
  useBackground1 = true;

  ngOnInit(): void {
    this.updateBackgroundImages();
  }

  get currentItem() {
    return this.items[this.currentIndex];
  }

  next() {
    if (this.isAnimating) return;
    this.previousIndex = this.currentIndex;
    this.currentIndex = (this.currentIndex + 1) % this.items.length;
    this.animationDirection = 'left';
    this.triggerAnimations();
  }

  previous() {
    if (this.isAnimating) return;
    this.previousIndex = this.currentIndex;
    this.currentIndex =
      (this.currentIndex - 1 + this.items.length) % this.items.length;
    this.animationDirection = 'right';
    this.triggerAnimations();
  }

  triggerAnimations() {
    this.isAnimating = true;
    const textLogo = document.querySelector('.text-logo') as HTMLElement;

    // Remove previous animation classes
    this.resetAnimationClasses();

    // Trigger text/logo animation
    if (this.animationDirection === 'right') {
      textLogo.classList.add('slide-out-left');
      setTimeout(() => {
        textLogo.classList.remove('slide-out-left');
        textLogo.classList.add('slide-in-right');
      }, 300);
    } else {
      textLogo.classList.add('slide-out-right');
      setTimeout(() => {
        textLogo.classList.remove('slide-out-right');
        textLogo.classList.add('slide-in-left');
      }, 300);
    }

    // Trigger background fade animation
    this.useBackground1 = !this.useBackground1;
    if (this.useBackground1) {
      this.backgroundState1 = 'visible';
      this.backgroundState2 = 'hidden';
    } else {
      this.backgroundState1 = 'hidden';
      this.backgroundState2 = 'visible';
    }

    this.updateBackgroundImages();

    setTimeout(() => {
      this.isAnimating = false;
    }, 500);
  }

  updateBackgroundImages() {
    if (this.useBackground1) {
      const background1 = document.querySelector('.background1') as HTMLElement;
      background1.style.backgroundImage = `url(${this.currentItem.backgroundImage})`;
    } else {
      const background2 = document.querySelector('.background2') as HTMLElement;
      background2.style.backgroundImage = `url(${this.currentItem.backgroundImage})`;
    }
  }

  resetAnimationClasses() {
    const textLogo = document.querySelector('.text-logo') as HTMLElement;
    if (textLogo) {
      textLogo.classList.remove(
        'slide-in-right',
        'slide-out-left',
        'slide-in-left',
        'slide-out-right'
      );
    }
  }

  tryApplication() {
    if (this.currentItem.pageLink)
      this.router.navigate([this.currentItem.pageLink]);
  }
}
