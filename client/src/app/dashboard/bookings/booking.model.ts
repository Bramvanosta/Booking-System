import { Client } from '../clients/client.model';

export class Booking {
  public id: number;
  public status: string;
  arrival_date: string;
  departure_date: string;
  client: Client;

  constructor(id: number, status: string, arrival_date: string, departure_date: string, client: Client) {
    this.id = id;
    this.status = status;
    this.arrival_date = arrival_date;
    this.departure_date = departure_date;
    this.client = client;
  }
}
