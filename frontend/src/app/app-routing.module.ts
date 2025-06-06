import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent as Home } from './home/home.component';
import { HomeComponent as OnakineHome } from './onakine/home/home.component';
import { OnakineComponent } from './onakine/onakine.component';
import { QuestionaryComponent } from './onakine/questionary/questionary.component';
import { LoginComponent } from './auth/login/login.component';
import { RegisterComponent } from './auth/register/register.component';
import { AuthRedirectGuard } from './auth/guard/auth-redirect.guard';
import { TurquoiseEvenementComponent } from './turquoise-evenement/turquoise-evenement.component';

const routes: Routes = [
  { path: '', component: Home },
  {
    path: 'onakine',
    component: OnakineComponent,
    children: [
      { path: 'questions', component: QuestionaryComponent },
      { path: '', component: OnakineHome },
    ],
  },
  {
    path: 'turquoise',
    component: TurquoiseEvenementComponent,
  },
  {
    path: 'auth',
    children: [
      {
        path: 'login',
        component: LoginComponent,
        canActivate: [AuthRedirectGuard],
      },
      {
        path: 'register',
        component: RegisterComponent,
        canActivate: [AuthRedirectGuard],
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
