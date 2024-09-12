abstract class Ticket {
  String movieTitle;
  DateTime showTime;
  double price;

  Ticket(this.movieTitle, this.showTime, this.price);

  void printTicket();
}

class Booking {
  Ticket ticket;
  String user;

  Booking(this.ticket, this.user);

  void completeBooking() {
    Logger.log("Booking successful for ${ticket.movieTitle} by user $user.");
  }

  void cancelBooking() {
    Logger.log("Booking canceled for ${ticket.movieTitle} by user $user.");
  }
}

// Pure Fabrication: Клас для логування
class Logger {
  static void log(String message) {
    final timestamp = DateTime.now();
    print("$timestamp: $message");
  }
}

// Реалізація класу квитка
class MovieTicket extends Ticket {
  MovieTicket(String movieTitle, DateTime showTime, double price)
      : super(movieTitle, showTime, price);

  @override
  void printTicket() {
    print("Ticket for $movieTitle at ${showTime.toString()} - Price: \$$price");
  }
}

void main() {
  final ticket = MovieTicket("Inception", DateTime(2024, 10, 1, 19, 30), 12.5);
  final booking = Booking(ticket, "John Doe");
  booking.completeBooking();
  booking.cancelBooking();
}
