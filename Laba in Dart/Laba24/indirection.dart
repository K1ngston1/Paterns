// Клас Користувача
class User {
  String name;
  User(this.name);
}

class Ticket {
  final String movieTitle;
  final DateTime showtime;
  final String seatNumber;
  bool isBooked;
  bool isPaid;

  Ticket({
    required this.movieTitle,
    required this.showtime,
    required this.seatNumber,
    this.isBooked = false,
    this.isPaid = false,
  });
}

class Database {
  void saveUser(User user) {
    print("Saving user ${user.name} to the database");
  }

  void saveTicket(Ticket ticket) {
    print(
        "Saving ticket for movie '${ticket.movieTitle}' at ${ticket.showtime} in seat ${ticket.seatNumber}");
    ticket.isBooked = true;
  }

  void updateTicketStatus(Ticket ticket, bool isBooked) {
    print(
        "Updating booking status for ticket in seat ${ticket.seatNumber} for movie '${ticket.movieTitle}'");
    ticket.isBooked = isBooked;
  }
}

class UserService {
  final Database _database;

  UserService(this._database);

  void saveUser(User user) {
    _database.saveUser(user);
  }
}

class BookingService {
  final Database _database;

  BookingService(this._database);

  void bookTicket(Ticket ticket) {
    if (!ticket.isBooked) {
      print(
          "Booking ticket for movie '${ticket.movieTitle}' at ${ticket.showtime} in seat ${ticket.seatNumber}");
      _database.saveTicket(ticket);
    } else {
      print(
          "Ticket in seat ${ticket.seatNumber} for movie '${ticket.movieTitle}' is already booked.");
    }
  }

  void cancelBooking(Ticket ticket) {
    if (ticket.isBooked) {
      print(
          "Canceling booking for seat ${ticket.seatNumber} for movie '${ticket.movieTitle}'");
      _database.updateTicketStatus(ticket, false);
    } else {
      print("Ticket is not booked yet.");
    }
  }
}

void main() {
  var database = Database();
  var userService = UserService(database);
  var bookingService = BookingService(database);

  var user = User("John Doe");
  userService.saveUser(user);
  var ticket = Ticket(
    movieTitle: "Inception",
    showtime: DateTime.now().add(Duration(days: 1)),
    seatNumber: "A12",
  );
  bookingService.bookTicket(ticket);
  bookingService.bookTicket(ticket);
  bookingService.cancelBooking(ticket);
  bookingService.cancelBooking(ticket);
}
