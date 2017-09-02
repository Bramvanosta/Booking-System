export class Client {
  id: number;
  title: string;
  first_name: string;
  last_name: string;
  email: string;
  address: string;
  zipCode: string;
  city: string;
  country: string;
  phone_number: string;
  mobile_number: string;

  constructor(id: number,
              title: string,
              first_name: string,
              last_name: string,
              email: string,
              address: string,
              zipCode: string,
              city: string,
              country: string,
              phone_number: string,
              mobile_number?: string) {
    this.id = id;
    this.title = title;
    this.first_name = first_name;
    this.last_name = last_name;
    this.email = email;
    this.address = address;
    this.zipCode = zipCode;
    this.city = city;
    this.country = country;
    this.phone_number = phone_number;
    this.mobile_number = mobile_number;
  }
}
