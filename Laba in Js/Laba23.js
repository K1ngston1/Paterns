// Abstract class for elements in the ticket system
class TicketSystemElement {
  accept(visitor) {
    throw new Error("Method not implemented");
  }
}

// Abstract class for visitors
class TicketSystemVisitor {
  visitMovie(movie) {
    throw new Error("Method not implemented");
  }

  visitShowtime(showtime) {
    throw new Error("Method not implemented");
  }

  visitBooking(booking) {
    throw new Error("Method not implemented");
  }

  visitUser(user) {
    throw new Error("Method not implemented");
  }
}

// Concrete class for Movie
class Movie extends TicketSystemElement {
  constructor(title) {
    super();
    this.title = title;
  }

  accept(visitor) {
    visitor.visitMovie(this);
  }

  display() {
    console.log(`Displaying Movie: ${this.title}`);
  }
}

// Concrete class for Showtime
class Showtime extends TicketSystemElement {
  constructor(time) {
    super();
    this.time = time;
  }

  accept(visitor) {
    visitor.visitShowtime(this);
  }

  display() {
    console.log(`Displaying Showtime: ${this.time}`);
  }
}

// Concrete class for Booking
class Booking extends TicketSystemElement {
  constructor(movie, showtime, user) {
    super();
    this.movie = movie;
    this.showtime = showtime;
    this.user = user;
  }

  accept(visitor) {
    visitor.visitBooking(this);
  }

  display() {
    console.log(
      `Booking Movie: ${this.movie.title} at Showtime: ${this.showtime.time} for User: ${this.user.name}`
    );
  }
}

// Concrete class for User
class User extends TicketSystemElement {
  constructor(name) {
    super();
    this.name = name;
  }

  accept(visitor) {
    visitor.visitUser(this);
  }

  display() {
    console.log(`User: ${this.name}`);
  }
}

// Concrete class for XML Exporter
class XMLExporter extends TicketSystemVisitor {
  visitMovie(movie) {
    console.log(`Exporting Movie to XML: ${movie.title}`);
  }

  visitShowtime(showtime) {
    console.log(`Exporting Showtime to XML: ${showtime.time}`);
  }

  visitBooking(booking) {
    console.log(`Exporting Booking to XML:`);
    booking.display();
  }

  visitUser(user) {
    console.log(`Exporting User to XML: ${user.name}`);
  }
}

// Example usage
const movie = new Movie("Inception");
const showtime = new Showtime("7:00 PM");
const user = new User("Alice");
const booking = new Booking(movie, showtime, user);

const xmlExporter = new XMLExporter();

movie.accept(xmlExporter);
showtime.accept(xmlExporter);
user.accept(xmlExporter);
booking.accept(xmlExporter);
