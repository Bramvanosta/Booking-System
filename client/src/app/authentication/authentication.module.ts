import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

import { authenticationRoutes } from './authentication.routes';

import { AuthenticationComponent } from './authentication.component';
import { SigninComponent } from './signin/signin.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';

@NgModule({
  declarations: [
    AuthenticationComponent,
    SigninComponent,
    ForgotPasswordComponent
  ],
  imports: [
    CommonModule,
    RouterModule.forChild(authenticationRoutes)
  ]
})
export class AuthenticationModule { }
