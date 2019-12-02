import { Component, OnInit, ViewChild, Input } from '@angular/core';
import { MatSort } from '@angular/material/sort';
import { Observable } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-history-table',
  templateUrl: './history-table.component.html',
  styleUrls: ['./history-table.component.scss']
})
export class HistoryTableComponent implements OnInit {
  @ViewChild(MatSort, {static: true}) sort: MatSort;
  @Input() dataSource$: Observable<any>;
  tableDataSource = new MatTableDataSource();
  displayedColumns: string[] = ['section_rec', 'course_id', 'course_name', 'year', 'num_students'];

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.dataSource$.subscribe(val => {
      this.tableDataSource.data = val;
      console.log(this.sort);
      this.tableDataSource.sort = this.sort;
    });
  }

  rowClicked(row) {
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: {
        record: row.section_rec
      },
      // queryParamsHandling: 'merge',
      // preserve the existing query params in the route
      // skipLocationChange: true
      // do not trigger navigation
    });
  }
}
