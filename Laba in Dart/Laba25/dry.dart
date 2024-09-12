// Без  dry

/*

class User {
  String name;
  String email;

  User(this.name, this.email);
}

class Admin {
  String name;
  String email;
  String adminRights;

  Admin(this.name, this.email, this.adminRights);
}

// Define a class for a movie with title, genre, and description
class Movie {
  String title;
  String genre;
  String description;

  Movie(this.title, this.genre, this.description);
}

class Ticket {
  Movie movie;
  DateTime showTime;
  String seatNumber;

  Ticket(this.movie, this.showTime, this.seatNumber);
}

class Booking {
  User user;
  Ticket ticket;

  Booking(this.user, this.ticket);
}

void main() {
  User user = User('John Doe', 'john@example.com');
  Admin admin = Admin('Jane Smith', 'jane@example.com', 'full');
  Movie movie = Movie('The Matrix', 'Sci-Fi', 'A computer hacker learns about the true nature of reality.');
  Ticket ticket = Ticket(movie, DateTime(2024, 9, 15, 19, 30), 'A12');
  Booking booking = Booking(user, ticket);
  print('User: ${user.name}, ${user.email}');
  print('Admin: ${admin.name}, ${admin.email}, Rights: ${admin.adminRights}');
  print('Movie: ${movie.title}, Genre: ${movie.genre}, Description: ${movie.description}');
  print('Ticket: Movie - ${ticket.movie.title}, Show Time - ${ticket.showTime}, Seat - ${ticket.seatNumber}');
  print('Booking: User - ${booking.user.name}, Movie - ${booking.ticket.movie.title}');
}





*/

// З Dry

class Person {
  String name;
  String email;

  Person(this.name, this.email);
}

class User extends Person {
  User(String name, String email) : super(name, email);
}

class Admin extends Person {
  String adminRights;

  Admin(String name, String email, this.adminRights) : super(name, email);
}

class Movie {
  String title;
  String genre;
  String description;

  Movie(this.title, this.genre, this.description);
}

class Ticket {
  Movie movie;
  DateTime showTime;
  String seatNumber;

  Ticket(this.movie, this.showTime, this.seatNumber);
}

class Booking {
  User user;
  Ticket ticket;

  Booking(this.user, this.ticket);
}

void main() {
  User user = User('John Doe', 'john@example.com');
  Admin admin = Admin('Jane Smith', 'jane@example.com', 'full');

  Movie movie = Movie('The Matrix', 'Sci-Fi',
      'A computer hacker learns about the true nature of reality.');
  Ticket ticket = Ticket(movie, DateTime(2024, 9, 15, 19, 30), 'A12');
  Booking booking = Booking(user, ticket);
  print('User: ${user.name}, ${user.email}');
  print('Admin: ${admin.name}, ${admin.email}, Rights: ${admin.adminRights}');
  print(
      'Movie: ${movie.title}, Genre: ${movie.genre}, Description: ${movie.description}');
  print(
      'Ticket: Movie - ${ticket.movie.title}, Show Time - ${ticket.showTime}, Seat - ${ticket.seatNumber}');
  print(
      'Booking: User - ${booking.user.name}, Movie - ${booking.ticket.movie.title}');
}
