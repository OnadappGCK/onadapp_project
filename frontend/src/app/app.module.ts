import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent as home } from './home/home.component';
import { HomeComponent as onakinehome } from './onakine/home/home.component';
import { OnakineComponent } from './onakine/onakine.component';
import { QuestionaryComponent } from './onakine/questionary/questionary.component';
import { SimpleFormComponent } from './onakine/questionary/simple-form/simple-form.component';
import { BodyFormComponent } from './onakine/questionary/body-form/body-form.component';
import { NavbarComponent } from './common/navbar/navbar.component';
import { FooterComponent } from './common/footer/footer.component';
import { AnswerComponent } from './onakine/questionary/answer/answer.component';
import { BurgerMenuComponent } from './common/navbar/burger-menu/burger-menu.component';
import { DualFormComponent } from './onakine/questionary/dual-form/dual-form.component';
import { SideMenuComponent } from './common/navbar/side-menu/side-menu.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { NoConnexionComponent } from './onakine/commun/no-connexion/no-connexion.component';
import { IntersectionObserverDirective } from './common/directives/intersection-observer.directive';
import { LoadingScreenComponent } from './common/loading-screen/loading-screen.component';
import { CommonModule } from '@angular/common';
import { CarouselCustomComponent } from './common/carousel-custom/carousel-custom.component';
import { AuthModule } from './auth/auth.module';
import { AuthInterceptor } from './auth/interceptor/auth.interceptor';
import { CalendarModule } from './turquoise-evenement/calendar.module';

@NgModule({
  declarations: [
    AppComponent, //WIP : séparer les imports par commun et app
    home,
    OnakineComponent,
    onakinehome,
    QuestionaryComponent,
    SimpleFormComponent,
    BodyFormComponent,
    FooterComponent,
    NavbarComponent,
    AnswerComponent,
    BurgerMenuComponent,
    CarouselCustomComponent,
    DualFormComponent,
    SideMenuComponent,
    NoConnexionComponent,
    LoadingScreenComponent,
    IntersectionObserverDirective,
  ],
  imports: [
    BrowserModule,
    CommonModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    FontAwesomeModule,
    AuthModule,
    CalendarModule,
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
