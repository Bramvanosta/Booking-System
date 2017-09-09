import { Rental } from './rental.model';

export class RentalCategory {
  public id: number;
  public name: string;
  public rentals: Rental[];

  constructor(id: number, name: string, rentals?: Rental[]) {
    this.id = id;
    this.name = name;
    this.rentals = rentals;
  }
}
