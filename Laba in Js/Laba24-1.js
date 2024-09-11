class Ticket {
  constructor(price) {
    this._price = price;
  }

  get price() {
    return this._price;
  }
}

class Booking {
  constructor(tickets) {
    this._tickets = tickets;
  }

  // Метод для обчислення загальної вартості всіх квитків
  totalCost() {
    return this._tickets.reduce((total, ticket) => total + ticket.price, 0);
  }

  addTicket(ticket) {
    this._tickets.push(ticket);
  }

  get tickets() {
    return [...this._tickets];
  }
}

// Тестування коду
const ticket1 = new Ticket(10.0);
const ticket2 = new Ticket(12.0);
const booking = new Booking([ticket1, ticket2]);

console.log(`Загальна вартість: $${booking.totalCost()}`);
const ticket3 = new Ticket(15.0);
booking.addTicket(ticket3);

console.log(`Оновлена загальна вартість: $${booking.totalCost()}`);
