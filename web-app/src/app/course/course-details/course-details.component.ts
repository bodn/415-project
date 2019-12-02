import { Component, OnInit } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { ActivatedRoute } from '@angular/router';
import { CourseService } from 'src/app/service/course.service';

@Component({
  selector: 'app-course-details',
  templateUrl: './course-details.component.html',
  styleUrls: ['./course-details.component.scss']
})
export class CourseDetailsComponent implements OnInit {
  panelOpenState = false;
  loading$ = new BehaviorSubject(false);
  courseId: number;
  courseDetails = {};
  courseHistory$ = new BehaviorSubject<any>([]);

  constructor(private route: ActivatedRoute, private courseService: CourseService) {
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      this.loading$.next(true);
      this.courseId = params.id;
      this.courseService.getCourseDetails(params.id).subscribe(resp => {
        this.courseDetails = resp.data[0];
        this.loading$.next(false);
      });

      this.courseService.getAllSectionsByCourse(params.id).subscribe(resp => {
        this.courseHistory$.next(resp.data);
      });
    });
  }

}
