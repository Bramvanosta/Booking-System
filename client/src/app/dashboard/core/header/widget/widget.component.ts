import { Component, OnInit } from '@angular/core';

import { Store } from '@ngrx/store';

import * as fromApp from '../../../../store/app.reducers';
import * as AuthenticationActions from '../../../../authentication/store/authentication.actions';

@Component({
  selector: 'app-header-widget',
  templateUrl: './widget.component.html',
  styleUrls: ['./widget.component.css']
})
export class HeaderWidgetComponent implements OnInit {

  constructor(private store: Store<fromApp.AppState>) {
  }

  ngOnInit() {
  }

  onLogout() {
    this.store.dispatch(new AuthenticationActions.Logout());
  }

}
