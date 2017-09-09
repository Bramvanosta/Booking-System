import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { MdIconModule, MdMenuModule } from '@angular/material';

import { dashboardRoutes } from './dashboard.routes';

import { SharedModule } from '../shared/shared.module';

import { AuthenticationGuard } from '../shared/authentication.guard';
import { DashboardGuard } from './dashboard.guard';
import { BookingsGuard } from './bookings/bookings.guard';
import { ClientsGuard } from './clients/clients.guard';
import { RentalsGuard } from './rentals/rentals.guard';
import { PricesGuard } from './prices/prices.guard';
import { ApiKeysGuard } from './api-keys/api-key.guard';
import { UsersGuard } from './users/users.guard';

import { DashboardComponent } from './dashboard.component';
import { HomeComponent } from './home/home.component';
import { BookingsComponent } from './bookings/bookings.component';
import { ClientsComponent } from './clients/clients.component';
import { HeaderComponent } from './core/header/header.component';
import { FooterComponent } from './core/footer/footer.component';
import { HeaderWidgetComponent } from './core/header/widget/widget.component';
import { SettingsMenuComponent } from './core/header/settings-menu/settings-menu.component';
import { RentalsComponent } from './rentals/rentals.component';
import { PricesComponent } from './prices/prices.component';
import { RightsComponent } from './rights/rights.component';
import { ApiKeysComponent } from './api-keys/api-keys.component';
import { UsersComponent } from './users/users.component';

@NgModule({
  declarations: [
    DashboardComponent,
    HomeComponent,
    BookingsComponent,
    ClientsComponent,
    HeaderComponent,
    FooterComponent,
    HeaderWidgetComponent,
    SettingsMenuComponent,
    RentalsComponent,
    PricesComponent,
    RightsComponent,
    ApiKeysComponent,
    UsersComponent,
  ],
  imports: [
    CommonModule,
    RouterModule.forChild(dashboardRoutes),
    SharedModule,
    MdIconModule,
    MdMenuModule
  ],
  providers: [
    AuthenticationGuard,
    DashboardGuard,
    BookingsGuard,
    ClientsGuard,
    RentalsGuard,
    PricesGuard,
    ApiKeysGuard,
    UsersGuard
  ]
})
export class DashboardModule {
}
