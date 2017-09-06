import { Component, OnInit } from '@angular/core';

import { Store } from "@ngrx/store";

import { Observable } from "rxjs/Observable";

import * as fromApp from '../../../../store/app.reducers';

@Component({
  selector: 'app-settings-menu',
  templateUrl: './settings-menu.component.html',
  styleUrls: ['./settings-menu.component.css']
})
export class SettingsMenuComponent implements OnInit {
  campgroundsState: Observable<any>;

  constructor(private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
    this.campgroundsState = this.store.select('campgrounds');
  }

}
