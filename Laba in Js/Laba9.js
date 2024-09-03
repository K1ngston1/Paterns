class IBooking {
  cost() {
    throw new Error("Method not implemented.");
  }

  description() {
    throw new Error("Method not implemented.");
  }
}

class Ticket extends IBooking {
  constructor({ cost, movieName, seatNumber }) {
    super();
    this._cost = cost;
    this._movieName = movieName;
    this._seatNumber = seatNumber;
  }

  cost() {
    return this._cost;
  }

  description() {
    return `Ticket for ${this._movieName}, Seat: ${this._seatNumber}`;
  }
}

class Order extends IBooking {
  constructor({ orderId }) {
    super();
    this._orderId = orderId;
    this.bookings = [];
  }

  cost() {
    return this.bookings.reduce(
      (totalCost, booking) => totalCost + booking.cost(),
      0
    );
  }

  addBooking(booking) {
    this.bookings.push(booking);
  }

  removeBooking(booking) {
    const index = this.bookings.indexOf(booking);
    if (index > -1) {
      this.bookings.splice(index, 1);
    }
  }

  description() {
    return `Order ${this._orderId}`;
  }
}

class CinemaOrder extends Order {
  constructor(orderId) {
    super({ orderId });
  }

  cost() {
    let totalCost = 0;
    this.bookings.forEach((booking) => {
      const currentCost = booking.cost();
      console.log(`Cost of ${booking.description()} = ${currentCost} currency`);
      totalCost += currentCost;
    });
    console.log(`Total cost of ${this.description()} = ${totalCost} currency`);
    return totalCost;
  }
}

// Example usage
const ticket1 = new Ticket({
  movieName: "Movie A",
  seatNumber: "A1",
  cost: 10,
});
const ticket2 = new Ticket({
  movieName: "Movie A",
  seatNumber: "A2",
  cost: 10,
});
const ticket3 = new Ticket({
  movieName: "Movie B",
  seatNumber: "B1",
  cost: 12,
});

const order1 = new CinemaOrder("Order001");
order1.addBooking(ticket1);
order1.addBooking(ticket2);
order1.addBooking(ticket3);

order1.cost();
