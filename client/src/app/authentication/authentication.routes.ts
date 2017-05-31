import { Routes } from '@angular/router';

import { AuthenticationComponent } from './authentication.component';
import { SigninComponent } from './signin/signin.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';

export const authenticationRoutes: Routes = [
  {
    path: '',
    component: AuthenticationComponent,
    children: [
      { path: 'login', component: SigninComponent },
      { path: 'forgot-password', component: ForgotPasswordComponent }
    ]
  }
];
