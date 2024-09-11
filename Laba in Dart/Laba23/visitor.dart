abstract class TicketSystemElement {
  void accept(TicketSystemVisitor visitor);
}

abstract class TicketSystemVisitor {
  void visitMovie(Movie movie);
  void visitShowtime(Showtime showtime);
  void visitBooking(Booking booking);
  void visitUser(User user);
}

class Movie implements TicketSystemElement {
  final String title;

  Movie(this.title);

  @override
  void accept(TicketSystemVisitor visitor) {
    visitor.visitMovie(this);
  }

  void display() {
    print("Displaying Movie: $title");
  }
}

class Showtime implements TicketSystemElement {
  final String time;

  Showtime(this.time);

  @override
  void accept(TicketSystemVisitor visitor) {
    visitor.visitShowtime(this);
  }

  void display() {
    print("Displaying Showtime: $time");
  }
}

class Booking implements TicketSystemElement {
  final Movie movie;
  final Showtime showtime;
  final User user;

  Booking(this.movie, this.showtime, this.user);

  @override
  void accept(TicketSystemVisitor visitor) {
    visitor.visitBooking(this);
  }

  void display() {
    print(
        "Booking Movie: ${movie.title} at Showtime: ${showtime.time} for User: ${user.name}");
  }
}

class User implements TicketSystemElement {
  final String name;

  User(this.name);

  @override
  void accept(TicketSystemVisitor visitor) {
    visitor.visitUser(this);
  }

  void display() {
    print("User: $name");
  }
}

class XMLExporter implements TicketSystemVisitor {
  @override
  void visitMovie(Movie movie) {
    print("Exporting Movie to XML: ${movie.title}");
  }

  @override
  void visitShowtime(Showtime showtime) {
    print("Exporting Showtime to XML: ${showtime.time}");
  }

  @override
  void visitBooking(Booking booking) {
    print("Exporting Booking to XML:");
    booking.display();
  }

  @override
  void visitUser(User user) {
    print("Exporting User to XML: ${user.name}");
  }
}

void main() {
  var movie = Movie("Inception");
  var showtime = Showtime("7:00 PM");
  var user = User("Alice");
  var booking = Booking(movie, showtime, user);

  var xmlExporter = XMLExporter();

  movie.accept(xmlExporter);
  showtime.accept(xmlExporter);
  user.accept(xmlExporter);
  booking.accept(xmlExporter);
}
