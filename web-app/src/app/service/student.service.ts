import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class StudentService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getStudentDetails(id): Observable<any> {
    console.log(`[Get Students Details]${this.url}/student/details/${id}`);
    return this.http.get(`${this.url}/student/details/${id}`);
  }
}