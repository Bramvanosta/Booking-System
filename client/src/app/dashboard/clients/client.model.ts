export class Client {
  id: number;
  title: string;
  firstName: string;
  lastName: string;
  email: string;
  address: string;
  zipCode: string;
  city: string;
  country: string;
  phoneNumber: string;
  mobileNumber: string;

  constructor(id: number,
              title: string,
              firstName: string,
              lastName: string,
              email: string,
              address: string,
              zipCode: string,
              city: string,
              country: string,
              phoneNumber: string,
              mobileNumber?: string) {
    this.id = id;
    this.title = title;
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.address = address;
    this.zipCode = zipCode;
    this.city = city;
    this.country = country;
    this.phoneNumber = phoneNumber;
    this.mobileNumber = mobileNumber;
  }
}
