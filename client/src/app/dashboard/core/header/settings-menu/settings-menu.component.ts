import { Component, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';

import { Observable } from 'rxjs/Observable';

import * as fromApp from '../../../../store/app.reducers';

@Component({
  selector: 'app-settings-menu',
  templateUrl: './settings-menu.component.html',
  styleUrls: ['./settings-menu.component.css']
})
export class SettingsMenuComponent implements OnInit {
  rightsState: Observable<any>;

  constructor(private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
    this.rightsState = this.store.select('rights');
  }

}
