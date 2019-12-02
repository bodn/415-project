import { Component, OnInit, Input } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-section-details',
  templateUrl: './section-details.component.html',
  styleUrls: ['./section-details.component.scss']
})
export class SectionDetailsComponent implements OnInit {
  @Input() sectionRecord;
  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
  }

  hideSection() {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: {}
    });
  }

}
