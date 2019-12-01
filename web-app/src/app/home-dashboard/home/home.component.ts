import { Component, OnInit } from '@angular/core';
import { BackendService } from 'src/app/service/backend.service';
import { BehaviorSubject } from 'rxjs';
import { CourseService } from 'src/app/service/course.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  loading$ = new BehaviorSubject(false);
  studentData$ = new BehaviorSubject<any>([]);
  courseData$ = new BehaviorSubject<any>([]);
  currentTabIndex = 0;
  constructor(private backendService: BackendService, private courseService: CourseService) { }
  ngOnInit() {
    this.loading$.next(true);
    this.backendService.getStudents().subscribe(res => {
      this.loading$.next(false);
      this.studentData$.next(res.data);
    });

    this.courseService.getAllCourses().subscribe(res => {
      this.courseData$.next(res.data);
    });

  }

  showTab(index) {
    this.currentTabIndex = index;
  }

}
