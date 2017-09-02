import { Client } from '../clients/client.model';

export class Booking {
  public id: number;
  public status: string;
  arrivalDate: string;
  departureDate: string;
  client: Client;

  constructor(id: number, status: string, arrivalDate: string, departureDate: string, client: Client) {
    this.id = id;
    this.status = status;
    this.arrivalDate = arrivalDate;
    this.departureDate = departureDate;
    this.client = client;
  }
}
