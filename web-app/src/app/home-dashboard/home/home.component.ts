import { Component, OnInit } from "@angular/core";
import { BackendService } from "src/app/service/backend.service";
import { BehaviorSubject, from } from "rxjs";
import { CourseService } from "src/app/service/course.service";
import { ActivatedRoute, Router } from "@angular/router";

@Component({
  selector: "app-home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"]
})
export class HomeComponent implements OnInit {
  loading$ = new BehaviorSubject(false);
  studentData$ = new BehaviorSubject<any>([]);
  courseData$ = new BehaviorSubject<any>([]);
  currentTabIndex = 0;
  constructor(
    private backendService: BackendService,
    private courseService: CourseService,
  ) {}
  ngOnInit() {
    if (window.history.state.tab) {
      this.currentTabIndex = window.history.state.tab;
    }
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
