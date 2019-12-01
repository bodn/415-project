import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatExpansionModule } from '@angular/material/expansion';
import { StudentDetailsComponent } from './student-details/student-details.component';
import { StudentRoutingModule } from './student-routing.module';


@NgModule({
  declarations: [StudentDetailsComponent],
  imports: [
    StudentRoutingModule,
    CommonModule,
    MatExpansionModule
  ]
})
export class StudentModule { }
