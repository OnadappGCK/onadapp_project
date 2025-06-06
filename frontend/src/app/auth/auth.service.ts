import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { AuthDataService } from './services/client/auth-data.service';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(private authData: AuthDataService) {
    this.loadUserFromLocalStorage();
  }

  user$ = new BehaviorSubject<any>(null);

  setUser(user: any) {
    this.user$.next(user);
    localStorage.setItem('access_token', user.access_token);
  }

  logout() {
    this.user$.next(null);
    localStorage.removeItem('access_token');
  }

  login(email: string, password: string) {
    return this.authData
      .login({ email, password })
      .pipe(tap((res) => this.setUser(res)));
  }

  register(payload: {
    email: string;
    password: string;
    pseudo: string;
    captcha: string;
  }): Observable<any> {
    return this.authData.register(payload);
  }

  loadUserFromLocalStorage() {
    const token = localStorage.getItem('access_token');
    if (token) {
      const payload = JSON.parse(atob(token.split('.')[1]));
      const user = { ...payload, access_token: token };
      this.user$.next(user);
    }
  }

  decodeToken(token: string): any {
    try {
      const payload = JSON.parse(atob(token.split('.')[1]));
      return {
        ...payload,
        access_token: token,
      };
    } catch (err) {
      console.error('Token invalide', err);
      return null;
    }
  }
}
