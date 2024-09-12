class Movie {
  constructor(title, description, showTime) {
    this.title = title;
    this.description = description;
    this.showTime = new Date(showTime);
  }
}

class Ticket {
  constructor(movie, seatNumber) {
    this.movie = movie;
    this.seatNumber = seatNumber;
  }
}

class Booking {
  constructor() {
    this.tickets = [];
  }

  addTicket(ticket) {
    this.tickets.push(ticket);
  }

  getTickets() {
    return [...this.tickets];
  }

  getTotalAmount() {
    const ticketPrice = 10.0;
    return this.tickets.length * ticketPrice;
  }
}

class PaymentProcessor {
  constructor(booking) {
    this.booking = booking;
  }

  processPayment() {
    const amount = this.booking.getTotalAmount();
    console.log(`Processing payment for amount: $${amount.toFixed(2)}`);
  }
}

// Example usage:
const movie = new Movie(
  "The Matrix",
  "A sci-fi classic",
  "2024-10-01T19:00:00"
);
const ticket1 = new Ticket(movie, "A1");
const ticket2 = new Ticket(movie, "A2");

const booking = new Booking();
booking.addTicket(ticket1);
booking.addTicket(ticket2);

const paymentProcessor = new PaymentProcessor(booking);
paymentProcessor.processPayment();
