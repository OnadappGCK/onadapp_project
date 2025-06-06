import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/app/environments/environment';

interface AuthResponse {
  message: string;
  user: any; // tu peux remplacer `any` par un modèle `User` si tu en crées un
}

@Injectable({
  providedIn: 'root',
})
export class AuthDataService {
  private authUrl = environment.urls.baseApiUrl + '/auth';

  constructor(private http: HttpClient) {}

  login(credentials: {
    email: string;
    password: string;
  }): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.authUrl}/login`, credentials);
  }

  register(data: {
    email: string;
    password: string;
    pseudo: string;
    captcha: string;
  }): Observable<AuthResponse> {
    console.log('sent' + data);
    return this.http.post<AuthResponse>(`${this.authUrl}/register`, data);
  }
}
