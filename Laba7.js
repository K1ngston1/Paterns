// Інтерфейси для квитків і бронювання
class ITicket {
  getTicketInfo() {
    throw new Error("Method not implemented.");
  }

  setTicketInfo(info) {
    throw new Error("Method not implemented.");
  }
}

class IReservation {
  bookTicket(ticket) {
    throw new Error("Method not implemented.");
  }

  cancelTicket(ticket) {
    throw new Error("Method not implemented.");
  }

  getReservedTickets() {
    throw new Error("Method not implemented.");
  }
}

// Клас для квитків кінотеатру
class MovieTicket extends ITicket {
  constructor(info) {
    super();
    this.info = info;
  }

  getTicketInfo() {
    return this.info;
  }

  setTicketInfo(info) {
    this.info = info;
  }
}

// Клас для системи бронювання
class ReservationSystem extends IReservation {
  constructor() {
    super();
    this._reservedTickets = [];
  }

  bookTicket(ticket) {
    this._reservedTickets.push(ticket);
    console.log(`Ticket booked: ${ticket.getTicketInfo()}`);
  }

  cancelTicket(ticket) {
    const index = this._reservedTickets.indexOf(ticket);
    if (index > -1) {
      this._reservedTickets.splice(index, 1);
      console.log(`Ticket cancelled: ${ticket.getTicketInfo()}`);
    } else {
      console.log(`Ticket not found: ${ticket.getTicketInfo()}`);
    }
  }

  getReservedTickets() {
    return [...this._reservedTickets];
  }
}

// Функція для виведення зарезервованих квитків
function printReservedTickets(reservationSystem) {
  console.log("Reserved Tickets:");
  reservationSystem.getReservedTickets().forEach((ticket) => {
    console.log(ticket.getTicketInfo());
  });
}

// Головна функція
function main() {
  const reservationSystem = new ReservationSystem();

  const ticket1 = new MovieTicket("Movie A - Seat 1");
  const ticket2 = new MovieTicket("Movie B - Seat 2");

  reservationSystem.bookTicket(ticket1);
  reservationSystem.bookTicket(ticket2);

  printReservedTickets(reservationSystem);

  console.log("--------");
  console.log("Cancelling Ticket");
  console.log("-------------");

  reservationSystem.cancelTicket(ticket1);

  printReservedTickets(reservationSystem);
}

// Запуск основної функції
main();
