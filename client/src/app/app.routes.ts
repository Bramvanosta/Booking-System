import { Routes } from '@angular/router';

export const appRoutes: Routes = [
  { path: '', loadChildren: './dashboard/dashboard.module#DashboardModule' },
];
