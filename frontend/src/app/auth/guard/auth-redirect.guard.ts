import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Injectable({ providedIn: 'root' })
export class AuthRedirectGuard implements CanActivate {
  constructor(private auth: AuthService, private router: Router) {}

  canActivate(): boolean {
    const isConnected = !!this.auth.user$.getValue();
    if (isConnected) {
      this.router.navigate(['/']);
      return false;
    }
    return true;
  }
}
