import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { CarouselItem } from 'src/app/models/common/carousel/carousel-item.model';
import { SlickCarouselModule } from 'ngx-slick-carousel';
import { faChevronCircleLeft } from '@fortawesome/free-solid-svg-icons';
import { faChevronCircleRight } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-carousel',
  templateUrl: './carousel.component.html',
  styleUrls: ['./carousel.component.scss'],
})
export class CarouselComponent {
  //@Input() items: CarouselItem[] = [];
  arrowCircleLeft = faChevronCircleLeft;
  arrowCircleRight = faChevronCircleRight;
  articles: CarouselItem[] = [
    {
      title: 'Sausset les pins',
      description: 'Superbe T3 en bors de mer',
      img: './assets/img/appt/t3.jpg',
    },
    {
      title: 'Sausset les pins',
      description: 'Terrasse vue mer & port',
      img: 'assets/img/appt/terrasse.jpg',
    },
    {
      title: 'Sausset les pins',
      description: 'Bord de mer : studio & terrasse',
      img: 'assets/img/appt/studio.jpg',
    },
    {
      title: 'Sausset les pins',
      description: "T2 les pieds dans l'eau",
      img: 'assets/img/appt/t2.png',
    },
    {
      title: 'Sausset les pins',
      description: 'Magnifique haut de villa sur la côte',
      img: 'assets/img/appt/villa.jpg',
    },
    // Ajoutez d'autres articles selon vos besoins
  ];

  currentIndex = 0;
  itemWidth = 400; // Largeur de chaque élément du carrousel
  translateValue = 0;

  ngOnInit(): void {
    this.updateTranslateValue();
  }

  next(): void {
    if (this.currentIndex < this.articles.length - 1) {
      this.currentIndex++;
      this.updateTranslateValue();
    }
  }

  prev(): void {
    if (this.currentIndex > 0) {
      this.currentIndex--;
      this.updateTranslateValue();
    }
  }

  updateTranslateValue(): void {
    this.translateValue = -this.currentIndex * this.itemWidth;
  }
}
