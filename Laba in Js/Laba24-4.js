// Абстрактний клас Ticket
class Ticket {
  getPrice() {
    throw new Error("Method not implemented");
  }

  getTicket() {
    throw new Error("Method not implemented");
  }

  gateDate() {
    throw new Error("Method not implemented");
  }
}

// Клас Booking, який реалізує Ticket
class Booking extends Ticket {
  constructor(ticket, date, price) {
    super();
    this._ticket = ticket;
    this._date = date;
    this._price = price;
  }

  getPrice() {
    return this._price;
  }

  getTicket() {
    return this._ticket;
  }

  gateDate() {
    return this._date;
  }
}

// Клас Cinema
class Cinema {
  constructor(name) {
    this._name = name;
    this._bookings = [];
  }

  get name() {
    return this._name;
  }

  addBooking(booking) {
    this._bookings.push(booking);
  }

  listBookings() {
    console.log(`Bookings for ${this._name}:`);
    this._bookings.forEach((booking) => {
      console.log(`Ticket: ${booking.getTicket()}`);
      console.log(`Date: ${booking.gateDate()}`);
      console.log(`Price: $${booking.getPrice()}`);
      console.log("---");
    });
  }
}

// Основна функція
function main() {
  const cinema = new Cinema("Grand Cinema");
  const booking1 = new Booking("TICKET123", "2024-09-15", 12.5);
  const booking2 = new Booking("TICKET456", "2024-09-16", 15.0);
  cinema.addBooking(booking1);
  cinema.addBooking(booking2);
  cinema.listBookings();
}

// Виклик основної функції
main();
