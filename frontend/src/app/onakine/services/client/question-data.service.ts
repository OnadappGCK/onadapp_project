import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/app/environments/environment';
import { Question } from '../../models/questions/question.model';
import { Result } from '../../models/questions/result.model';

@Injectable({
  providedIn: 'root',
})
export class QuestionDataService {
  private apiQuestionsUrl =
    environment.urls.baseApiUrl + '/onakine' + '/questions'; // URL de votre API
  private apiResultUrl = environment.urls.baseApiUrl + '/onakine' + '/result'; // URL de votre API

  constructor(private http: HttpClient) {}

  getQuestions(idList: number[]): Observable<Question[]> {
    // Convertir le tableau d'ID en chaîne de caractères séparée par des virgules
    const idListString = idList.join(',');
    // Contacter l'API et retourner le résultat
    return this.http.get<Question[]>(`${this.apiQuestionsUrl}/${idListString}`);
  }

  getAnswer(idList: number[]): Observable<Result[]> {
    const idListString = idList.join(',');
    return this.http.get<Result[]>(`${this.apiResultUrl}/${idListString}`);
  }
}
