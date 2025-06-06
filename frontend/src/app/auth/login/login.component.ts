import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent {
  errorMessage = '';

  form = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required],
  });

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router
  ) {}

  submit() {
    if (this.form.valid) {
      const { email, password } = this.form.value;
      if (email && password) {
        this.auth.login(email, password).subscribe({
          next: (res) => {
            console.log('Connecté !', res);
            this.router.navigate(['/']); // page d'accueil
            this.auth.loadUserFromLocalStorage();
          },
          error: (err) => {
            console.error('Erreur login', err),
              (this.errorMessage = err.error.message || 'Erreur de connexion');
          },
        });
      }
    }
  }
}
