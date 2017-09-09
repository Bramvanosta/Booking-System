import { Client } from '../clients/client.model';
import { Rental } from '../rentals/rental.model';
import { Person } from './person.model';
import { Payment } from './payment.model';

export class Booking {
  public id: number;
  public status: string;
  public arrival_date: string;
  public departure_date: string;
  public client: Client;
  public rentals: Rental[];
  public persons: Person[];
  public payments: Payment[];

  constructor(id: number,
              status: string,
              arrival_date: string,
              departure_date: string,
              client: Client,
              rentals: Rental[],
              persons: Person[],
              payments: Payment[]) {
    this.id = id;
    this.status = status;
    this.arrival_date = arrival_date;
    this.departure_date = departure_date;
    this.client = client;
    this.rentals = rentals;
    this.persons = persons;
    this.payments = payments;
  }
}
