import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { MdButtonModule, MdInputModule, MdSnackBarModule } from '@angular/material';

import { authenticationRoutes } from './authentication.routes';

import { SharedModule } from '../shared/shared.module';

import { AuthenticationComponent } from './authentication.component';
import { SigninComponent } from './signin/signin.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { UpdatePasswordComponent } from './update-password/update-password.component';

@NgModule({
  declarations: [
    AuthenticationComponent,
    SigninComponent,
    ResetPasswordComponent,
    UpdatePasswordComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    RouterModule.forChild(authenticationRoutes),
    SharedModule,
    MdInputModule,
    MdButtonModule,
    MdSnackBarModule
  ],
  providers: []
})
export class AuthenticationModule {
}
