import { Component, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';

import * as fromApp from '../../../store/app.reducers';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  campgroundsState: Observable<any>;

  constructor(private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
    this.campgroundsState = this.store.select('campgrounds');
  }

}
