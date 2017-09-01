import { Routes } from '@angular/router';

import { AuthenticationComponent } from './authentication.component';
import { SigninComponent } from './signin/signin.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { UpdatePasswordComponent } from './update-password/update-password.component';

export const authenticationRoutes: Routes = [
  {
    path: '',
    component: AuthenticationComponent,
    children: [
      { path: 'login', component: SigninComponent, data: { state: 'login' } },
      { path: 'reset-password', component: ResetPasswordComponent, data: { state: 'reset-password' } },
      { path: 'update-password', component: UpdatePasswordComponent, data: { state: 'update-password' } }
    ]
  }
];
