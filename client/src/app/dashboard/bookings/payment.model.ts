export class Payment {
  public id: number;
  public price_cents: number;
  public price_currency: string;
  public method: string;

  constructor(id: number, price_cents: number, price_currency: string, method: string) {
    this.id = id;
    this.price_cents = price_cents;
    this.price_currency = price_currency;
    this.method = method;
  }
}
