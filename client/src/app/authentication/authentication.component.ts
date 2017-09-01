import { Component, OnInit } from '@angular/core';

import { fadeAndScaleInOut } from '../shared/router.animations';

@Component({
  selector: 'app-authentication',
  templateUrl: './authentication.component.html',
  styleUrls: ['./authentication.component.css'],
  animations: [fadeAndScaleInOut]
})
export class AuthenticationComponent implements OnInit {

  constructor() {
  }

  ngOnInit() {
  }

  getState(outlet) {
    return outlet.activatedRouteData.state;
  }

}
