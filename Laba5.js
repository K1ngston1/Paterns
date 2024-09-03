class CinemaType {
  static SMALL = "small";
  static MEDIUM = "medium";
  static LARGE = "large";
}

class BookingStatus {
  static AVAILABLE = "available";
  static BOOKED = "booked";
  static CLOSED = "closed";
}

class Ticket {
  constructor(ticketType, price) {
    this.ticketType = ticketType;
    this.price = price;
  }

  toString() {
    return `Ticket Type: ${this.ticketType}, Price: ${this.price}`;
  }
}

class CinemaBuilder {
  constructor({
    name = "Unnamed Cinema",
    cost = 5,
    type = CinemaType.SMALL,
    status = BookingStatus.AVAILABLE,
    cinemaTickets = [],
  } = {}) {
    this._name = name;
    this._cost = cost;
    this._type = type;
    this._status = status;
    this._cinemaTickets = cinemaTickets;
  }

  get name() {
    return this._name;
  }
  set name(value) {
    this._name = value;
  }

  get cost() {
    return this._cost;
  }
  set cost(value) {
    this._cost = value;
  }

  get type() {
    return this._type;
  }
  set type(value) {
    this._type = value;
  }

  get status() {
    return this._status;
  }
  set status(value) {
    this._status = value;
  }

  get cinemaTickets() {
    return this._cinemaTickets;
  }
  set cinemaTickets(value) {
    this._cinemaTickets = value;
  }

  build() {
    return new Cinema(this);
  }

  static get builder() {
    return new CinemaBuilder();
  }
}

class Cinema {
  constructor(builder) {
    this.name = builder.name;
    this.cost = builder.cost;
    this.type = builder.type;
    this.status = builder.status;
    this.cinemaTickets = builder.cinemaTickets;
  }

  toString() {
    let infoStr = `Cinema: ${this.name}\n`;
    infoStr += `Type: ${this.type}\n`;
    infoStr += `Tickets:\n`;
    for (const ticket of this.cinemaTickets) {
      infoStr += `- ${ticket.toString()}\n`;
    }
    return infoStr;
  }
}

function main() {
  let cinemaBuilder = CinemaBuilder.builder;

  cinemaBuilder.name = "Majestic Cinema";
  cinemaBuilder.cost = 20;
  cinemaBuilder.type = CinemaType.LARGE;
  cinemaBuilder.status = BookingStatus.AVAILABLE;
  cinemaBuilder.cinemaTickets = [
    new Ticket("Regular", 10.0),
    new Ticket("VIP", 25.0),
  ];

  let cinema = cinemaBuilder.build();
  console.log(cinema.toString());
  console.log("----".repeat(20));
  let newCinemaBuilder = CinemaBuilder.builder;
  newCinemaBuilder.name = "Majestic Cinema2";
  newCinemaBuilder.cost = 56;
  newCinemaBuilder.type = CinemaType.SMALL;
  newCinemaBuilder.status = BookingStatus.AVAILABLE;
  newCinemaBuilder.cinemaTickets = [
    new Ticket("Regular", 10.0),
    new Ticket("Regular", 10.0),
    new Ticket("VIP", 25.0),
    new Ticket("Regular", 10.0),
  ];

  let newCinema = newCinemaBuilder.build();
  console.log(newCinema.toString());
}
main();
