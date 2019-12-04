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
  loading$ = new BehaviorSubject(false);
  courseId: number;
  sectionRecord = 0;
  professorId = 0;
  courseDetails = null;
  professorList = [];
  displaySection = new BehaviorSubject(false);
  courseTotal = 0;
  courseHistory$ = new BehaviorSubject<any>([]);

  constructor(private route: ActivatedRoute, private courseService: CourseService) {
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      this.loading$.next(true);
      // On first load
      if (!this.courseDetails) {
        this.courseId = params.id;
        this.courseService.getCourseDetails(params.id).subscribe(resp => {
          this.courseDetails = resp.data[0];
          this.loading$.next(false);
        });

        this.courseHistory$.subscribe(val => {
          console.log(val);
          const set = new Set([]);
          val.foreach(section => {
            set.add(section.professor);
          });
          this.professorList = [...set];
        });

        this.courseService.getAllSectionsByCourse(params.id).subscribe(resp => {
          console.log(resp.data)
          this.courseHistory$.next(resp.data);
        });
      }
    });

    this.route.queryParams.subscribe(params => {
      if (params.record) {
        this.sectionRecord = params.record;
        this.professorId = params.pid;
        this.displaySection.next(true);
      } else {
        this.displaySection.next(false);
      }
    });

    this.courseHistory$.subscribe(val => {
      val.forEach(element => {
        this.courseTotal += element.num_students;
      });
    })
  }

}
