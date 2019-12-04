import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentAddComponent } from './student-add/student-add.component';


const formsModule: Routes = [
  {
    path: 'forms/add/student',
    component: StudentAddComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(formsModule)],
  exports: [RouterModule]
})
export class FormsRoutingModule { }
