/*
class Movie {
  final String id;
  final String title;
  final String genre;

  Movie(this.id, this.title, this.genre);

  @override
  String toString() => 'Movie(id: $id, title: $title, genre: $genre)';
}

class Screening {
  final String id;
  final Movie movie;
  final DateTime startTime;
  final int availableSeats;

  Screening(this.id, this.movie, this.startTime, this.availableSeats);

  @override
  String toString() =>
      'Screening(id: $id, movie: ${movie.title}, startTime: $startTime, availableSeats: $availableSeats)';
}

class Booking {
  final String id;
  final List<Ticket> tickets;

  Booking(this.id, this.tickets);

  @override
  String toString() =>
      'Booking(id: $id, tickets: ${tickets.map((t) => t.toString()).join(', ')})';

  void addTicket(Ticket ticket) {
    tickets.add(ticket);
  }

  void removeTicket(String ticketId) {
    tickets.removeWhere((t) => t.id == ticketId);
  }
}

*/

class Movie {
  final String id;
  final String title;
  final String genre;

  Movie(this.id, this.title, this.genre);

  @override
  String toString() => 'Movie(id: $id, title: $title, genre: $genre)';
}

class Screening {
  final Movie movie;
  final DateTime startTime;
  int availableSeats;

  Screening(this.movie, this.startTime, this.availableSeats);

  @override
  String toString() =>
      'Screening(movie: ${movie.title}, startTime: $startTime, availableSeats: $availableSeats)';
}

class Ticket {
  final Screening screening;
  final String seat;

  Ticket(this.screening, this.seat);

  @override
  String toString() =>
      'Ticket(screening: ${screening.movie.title}, seat: $seat)';
}

class Booking {
  final List<Ticket> tickets = [];

  void addTicket(Ticket ticket) {
    tickets.add(ticket);
  }

  void removeTicket(Ticket ticket) {
    tickets.remove(ticket);
  }

  @override
  String toString() =>
      'Booking(tickets: ${tickets.map((t) => t.toString()).join(', ')})';
}

void main() {
  var movie = Movie('1', 'Inception', 'Sci-Fi');

  var screening = Screening(movie, DateTime.now().add(Duration(days: 1)), 100);

  var ticket1 = Ticket(screening, 'A1');
  var ticket2 = Ticket(screening, 'A2');

  var booking = Booking();
  booking.addTicket(ticket1);
  booking.addTicket(ticket2);

  print(movie);
  print(screening);
  print(ticket1);
  print(ticket2);
  print(booking);
  var ticket3 = Ticket(screening, 'A3');
  booking.addTicket(ticket3);
  print('After adding a ticket:');
  print(booking);

  booking.removeTicket(ticket1);
  print('After removing a ticket:');
  print(booking);
}
