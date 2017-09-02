import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MdIconModule } from '@angular/material';

import { dashboardRoutes } from './dashboard.routes';

import { SharedModule } from '../shared/shared.module';

import { AuthenticationGuard } from '../shared/authentication.guard';
import { DashboardGuard } from './dashboard.guard';
import { BookingsGuard } from './bookings/bookings.guard';
import { ClientsGuard } from './clients/clients.guard';

import { DashboardComponent } from './dashboard.component';
import { HomeComponent } from './home/home.component';
import { BookingsComponent } from './bookings/bookings.component';
import { ClientsComponent } from './clients/clients.component';
import { HeaderComponent } from './core/header/header.component';
import { FooterComponent } from './core/footer/footer.component';
import { HeaderWidgetComponent } from './core/header/widget/widget.component';

@NgModule({
  declarations: [
    DashboardComponent,
    HomeComponent,
    BookingsComponent,
    ClientsComponent,
    HeaderComponent,
    FooterComponent,
    HeaderWidgetComponent,
  ],
  imports: [
    CommonModule,
    RouterModule.forChild(dashboardRoutes),
    SharedModule,
    MdIconModule,
  ],
  providers: [
    AuthenticationGuard,
    DashboardGuard,
    BookingsGuard,
    ClientsGuard
  ]
})
export class DashboardModule {
}
