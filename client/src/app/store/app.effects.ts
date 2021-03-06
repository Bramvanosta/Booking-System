import { AuthenticationEffects } from '../authentication/store/authentication.effects';
import { CampgroundsEffects } from '../dashboard/campgrounds/store/campgrounds.effects';
import { BookingsEffects } from '../dashboard/bookings/store/bookings.effects';
import { ClientsEffects } from '../dashboard/clients/store/clients.effects';
import { RightsEffects } from '../dashboard/rights/store/rights.effects';
import { RentalsEffects } from '../dashboard/rentals/store/rentals.effects';
import { PricesEffects } from '../dashboard/prices/store/prices.effects';
import { ApiKeysEffects } from '../dashboard/api-keys/store/api-key.effects';
import { UsersEffects } from '../dashboard/users/store/users.effects';

export const effects = [
  AuthenticationEffects,
  CampgroundsEffects,
  BookingsEffects,
  ClientsEffects,
  RightsEffects,
  RentalsEffects,
  PricesEffects,
  ApiKeysEffects,
  UsersEffects
];
