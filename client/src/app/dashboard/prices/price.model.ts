export class Price {
  public id: number;
  public name: string;
  public price_cents: number;
  public price_currency: string;

  constructor(id: number, name: string, price_cents: number, price_currency: string) {
    this.id = id;
    this.name = name;
    this.price_cents = price_cents;
    this.price_currency = price_currency;
  }
}
