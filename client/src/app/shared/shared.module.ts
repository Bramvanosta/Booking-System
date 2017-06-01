import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MdButtonModule } from '@angular/material';

import { LoadingButtonComponent } from './loading-button/loading-button.component';

@NgModule({
  declarations: [
    LoadingButtonComponent
  ],
  imports: [
    CommonModule,
    MdButtonModule
  ],
  exports: [
    LoadingButtonComponent
  ]
})
export class SharedModule { }
