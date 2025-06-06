import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { AuthService } from '../auth.service';
import { environment } from 'src/app/environments/environment';
import { RegisterDto } from '../model/data/register-dto';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent {
  form = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    pseudo: ['', Validators.required],
    password: ['', [Validators.required, Validators.minLength(6)]],
    confirmPassword: ['', Validators.required],
  });

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router
  ) {}

  environment = environment;

  captchaToken: string | null = null;

  onCaptchaResolved(token: string | null): void {
    if (token) {
      this.captchaToken = token;
    } else {
      this.captchaToken = null;
      console.warn('Captcha non résolu');
    }
  }

  hasUpperCase() {
    return /[A-Z]/.test(this.form.value.password ?? '');
  }
  hasDigit() {
    return /\d/.test(this.form.value.password ?? '');
  }
  hasLength() {
    return (this.form.value.password ?? '').length >= 8;
  }

  submit() {
    if (this.environment.useRecaptcha && !this.captchaToken) {
      alert('Veuillez compléter le CAPTCHA.');
      return;
    }

    const { email, password, pseudo, confirmPassword } = this.form.value;

    if (password !== confirmPassword) {
      alert('Les mots de passe ne correspondent pas');
      return;
    }

    if (!this.form.valid) {
      alert('Le formulaire est invalide');
      return;
    }

    if (!email || !password || !pseudo) {
      alert('Tous les champs doivent être remplis');
      return;
    }

    const payload: RegisterDto = {
      email: email ?? '',
      password: password ?? '',
      pseudo: pseudo ?? '',
      captcha: this.environment.useRecaptcha
        ? this.captchaToken ?? ''
        : 'no-captcha',
    };

    // Ajoute le token si on est en prod
    if (this.environment.useRecaptcha) {
      payload.captcha = this.captchaToken!;
    }

    this.auth.register(payload).subscribe({
      next: (res) => {
        console.log('Inscription réussie', res);
        alert('Compte créé ! Vous pouvez maintenant vous connecter.');
        this.auth.login(payload.email, payload.password).subscribe({
          next: () => {
            this.router.navigate(['/']); // page d'accueil
          },
          error: () => {
            alert('Inscription réussie mais échec de la connexion automatique');
          },
        });
      },
      error: (err) => {
        console.error('Erreur inscription', err);
        alert("Erreur lors de l'inscription");
      },
    });
  }
}
