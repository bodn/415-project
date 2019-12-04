import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StudentAddComponent } from './student-add/student-add.component';
import { FormsRoutingModule } from './forms-routing.module';
import { MatStepperModule } from '@angular/material/stepper';
import { MatFormFieldModule, MatInputModule, MatButtonModule, MatSelectModule, MatSnackBarModule } from '@angular/material';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { StudentCourseAddComponent } from './student-course-add/student-course-add.component';
import { StudentGradeUpdateComponent } from './student-grade-update/student-grade-update.component';

@NgModule({
  declarations: [StudentAddComponent, StudentCourseAddComponent, StudentGradeUpdateComponent],
  imports: [
    FormsRoutingModule,
    CommonModule,
    MatStepperModule,
    ReactiveFormsModule,
    FormsModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSelectModule,
    MatSnackBarModule
  ]
})
export class AppFormsModule {}
