import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent implements OnInit {
  @Input() sectionRecord;
  constructor() { }

  ngOnInit() {
  }

}
