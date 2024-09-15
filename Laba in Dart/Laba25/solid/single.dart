class Movie {
  String title;
  String genre;
  DateTime releaseDate;

  Movie(this.title, this.genre, this.releaseDate);
}

class Ticket {
  Movie movie;
  DateTime showTime;
  double price;

  Ticket(this.movie, this.showTime, this.price);
}

class Booking {
  Ticket ticket;
  int seatNumber;

  Booking(this.ticket, this.seatNumber);
}

class User {
  String username;
  String email;

  User(this.username, this.email);
}

class UserManager {
  void registerUser(User user) {
    print('User registered: ${user.username}');
  }

  void authenticateUser(String username, String password) {
    print('User authenticated: $username');
  }
}

class TicketManager {
  void addTicket(Ticket ticket) {
    print('Ticket added: ${ticket.movie.title} at ${ticket.showTime}');
  }

  void updateTicket(Ticket ticket) {
    print('Ticket updated: ${ticket.movie.title} at ${ticket.showTime}');
  }
}

class PersistenceManager {
  void saveBooking(Booking booking) {
    print(
        'Booking saved: ${booking.ticket.movie.title}, Seat: ${booking.seatNumber}');
  }

  void saveTicket(Ticket ticket) {
    print('Ticket saved: ${ticket.movie.title} at ${ticket.showTime}');
  }
}

class BookingManager {
  void createBooking(Booking booking) {
    print(
        'Booking created: ${booking.ticket.movie.title}, Seat: ${booking.seatNumber}');
  }

  void cancelBooking(Booking booking) {
    print(
        'Booking cancelled: ${booking.ticket.movie.title}, Seat: ${booking.seatNumber}');
  }
}

void main() {
  Movie movie = Movie('Inception', 'Sci-Fi', DateTime(2010, 7, 16));
  Ticket ticket = Ticket(movie, DateTime(2024, 9, 30, 20, 0), 12.99);
  Booking booking = Booking(ticket, 5);
  User user = User('john_doe', 'john.doe@example.com');

  UserManager userManager = UserManager();
  TicketManager ticketManager = TicketManager();
  BookingManager bookingManager = BookingManager();
  PersistenceManager persistenceManager = PersistenceManager();

  userManager.registerUser(user);
  userManager.authenticateUser(user.username, 'securePassword123');

  ticketManager.addTicket(ticket);
  ticketManager.updateTicket(ticket);

  bookingManager.createBooking(booking);
  bookingManager.cancelBooking(booking);

  persistenceManager.saveTicket(ticket);
  persistenceManager.saveBooking(booking);
}
