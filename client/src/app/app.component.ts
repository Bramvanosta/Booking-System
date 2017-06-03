import { Component } from '@angular/core';
import { Angular2TokenService } from 'angular2-token';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private authenticationService: Angular2TokenService) {
    this.authenticationService.init({
      apiBase: 'http://api.booking-system.dev',
      apiPath: 'v1/auth',

      signInPath: 'sign_in',
      signInRedirect: '/',
      signInStoredUrlStorageKey: 'redirectAfterLoginPath',
      signOutPath: 'sign_out',
      signOutFailedValidate: true,
      validateTokenPath: 'validate_token',
      resetPasswordPath: 'password',
      resetPasswordCallback: 'http://localhost:4200/update-password',
      updatePasswordPath: 'password'
    })
  }
}
