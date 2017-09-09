import { Routes } from '@angular/router';

import { AuthenticationGuard } from '../shared/authentication.guard';
import { DashboardGuard } from './dashboard.guard';
import { BookingsGuard } from './bookings/bookings.guard';
import { ClientsGuard } from './clients/clients.guard';
import { RentalsGuard } from './rentals/rentals.guard';

import { DashboardComponent } from './dashboard.component';
import { HomeComponent } from './home/home.component';
import { BookingsComponent } from './bookings/bookings.component';
import { ClientsComponent } from './clients/clients.component';
import { RentalsComponent } from './rentals/rentals.component';
import { PricesComponent } from './prices/prices.component';
import { RightsComponent } from './rights/rights.component';
import { ApiKeysComponent } from './api-keys/api-keys.component';
import { UsersComponent } from './users/users.component';

export const dashboardRoutes: Routes = [
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthenticationGuard, DashboardGuard],
    children: [
      { path: '', component: HomeComponent },
      { path: 'bookings', component: BookingsComponent, canActivate: [BookingsGuard] },
      { path: 'clients', component: ClientsComponent, canActivate: [ClientsGuard] },
      { path: 'rentals', component: RentalsComponent, canActivate: [RentalsGuard] },
      { path: 'prices', component: PricesComponent },
      { path: 'rights', component: RightsComponent },
      { path: 'api-keys', component: ApiKeysComponent },
      { path: 'users', component: UsersComponent },
    ]
  }
];
