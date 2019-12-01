import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class CourseService {
  private url;
  constructor(private http: HttpClient) {
    this.url = environment.apiURL;
  }

  getAllCourses(): Observable<any> {
    return this.http.get(`${this.url}/course/`);
  }

}
