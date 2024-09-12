// Клас Користувача
class User {
  constructor(name) {
    this.name = name;
  }
}

class Ticket {
  constructor(
    movieTitle,
    showtime,
    seatNumber,
    isBooked = false,
    isPaid = false
  ) {
    this.movieTitle = movieTitle;
    this.showtime = showtime;
    this.seatNumber = seatNumber;
    this.isBooked = isBooked;
    this.isPaid = isPaid;
  }
}

class Database {
  saveUser(user) {
    console.log(`Saving user ${user.name} to the database`);
  }

  saveTicket(ticket) {
    console.log(
      `Saving ticket for movie '${ticket.movieTitle}' at ${ticket.showtime} in seat ${ticket.seatNumber}`
    );
    ticket.isBooked = true;
  }

  updateTicketStatus(ticket, isBooked) {
    console.log(
      `Updating booking status for ticket in seat ${ticket.seatNumber} for movie '${ticket.movieTitle}'`
    );
    ticket.isBooked = isBooked;
  }
}

class UserService {
  constructor(database) {
    this._database = database;
  }

  saveUser(user) {
    this._database.saveUser(user);
  }
}

class BookingService {
  constructor(database) {
    this._database = database;
  }

  bookTicket(ticket) {
    if (!ticket.isBooked) {
      console.log(
        `Booking ticket for movie '${ticket.movieTitle}' at ${ticket.showtime} in seat ${ticket.seatNumber}`
      );
      this._database.saveTicket(ticket);
    } else {
      console.log(
        `Ticket in seat ${ticket.seatNumber} for movie '${ticket.movieTitle}' is already booked.`
      );
    }
  }

  cancelBooking(ticket) {
    if (ticket.isBooked) {
      console.log(
        `Canceling booking for seat ${ticket.seatNumber} for movie '${ticket.movieTitle}'`
      );
      this._database.updateTicketStatus(ticket, false);
    } else {
      console.log("Ticket is not booked yet.");
    }
  }
}

// Основна програма
function main() {
  const database = new Database();
  const userService = new UserService(database);
  const bookingService = new BookingService(database);

  // Створюємо користувача
  const user = new User("John Doe");
  userService.saveUser(user);

  // Створюємо квиток на фільм
  const ticket = new Ticket(
    "Inception",
    new Date(Date.now() + 24 * 60 * 60 * 1000), // Дата через 1 день
    "A12"
  );

  // Бронюємо квиток
  bookingService.bookTicket(ticket);

  // Спробуємо ще раз забронювати той самий квиток
  bookingService.bookTicket(ticket);

  // Скасування бронювання
  bookingService.cancelBooking(ticket);

  // Повторне скасування
  bookingService.cancelBooking(ticket);
}

main();
