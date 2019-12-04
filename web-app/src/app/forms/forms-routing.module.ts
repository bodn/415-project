import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentAddComponent } from './student-add/student-add.component';
import { StudentCourseAddComponent } from './student-course-add/student-course-add.component';


const formsModule: Routes = [
  {
    path: 'forms/add/student',
    component: StudentAddComponent,
  },
  {
    path: 'forms/add/student-to-course',
    component: StudentCourseAddComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(formsModule)],
  exports: [RouterModule]
})
export class FormsRoutingModule { }
