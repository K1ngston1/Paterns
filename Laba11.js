const MovieType = {
  ACTION: "action",
  COMEDY: "comedy",
  DRAMA: "drama",
};

class IMovie {
  getMovieName() {
    throw new Error("Method getMovieName() must be implemented.");
  }
}

class ActionMovie extends IMovie {
  getMovieName() {
    return "Action Movie";
  }
}

class ComedyMovie extends IMovie {
  getMovieName() {
    return "Comedy Movie";
  }
}

class DramaMovie extends IMovie {
  getMovieName() {
    return "Drama Movie";
  }
}

class ICustomer {
  requestMovie(movie) {
    throw new Error("Method requestMovie() must be implemented.");
  }

  selectSeats() {
    throw new Error("Method selectSeats() must be implemented.");
  }

  watchMovie() {
    throw new Error("Method watchMovie() must be implemented.");
  }

  getName() {
    throw new Error("Method getName() must be implemented.");
  }
}

class TicketingSystem {
  bookTickets() {
    console.log("The tickets are being booked");
  }

  confirmBooking() {
    console.log("Booking confirmed");
  }
}

class Clerk {
  acceptBooking(customer) {
    console.log(`Clerk accepted the booking from ${customer.getName()}`);
  }

  processBooking() {
    console.log("Processing booking in the system");
  }

  deliverTickets(customer) {
    console.log(
      `Tickets are ready, delivering to the customer ${customer.getName()}`
    );
  }
}

class Customer extends ICustomer {
  constructor(name) {
    super();
    this.name = name;
  }

  requestMovie(movie) {
    console.log(
      `Customer ${this.name} checks the details of ${movie.getMovieName()}`
    );
  }

  selectSeats() {
    console.log(`Customer ${this.name} selects seats`);
    return { 1: "A1", 2: "A2" };
  }

  watchMovie() {
    console.log(`Customer ${this.name} starts watching the movie`);
  }

  getName() {
    return this.name;
  }
}

class CinemaFacade {
  constructor() {
    this.ticketingSystem = new TicketingSystem();
    this.clerk = new Clerk();
    this.movies = {
      [MovieType.ACTION]: new ActionMovie(),
      [MovieType.COMEDY]: new ComedyMovie(),
      [MovieType.DRAMA]: new DramaMovie(),
    };
  }

  getMovie(type) {
    return this.movies[type];
  }

  bookTickets(customer) {
    this.clerk.acceptBooking(customer);
    this.clerk.processBooking();
    this._ticketingSystemWork();
    this.clerk.deliverTickets(customer);
  }

  _ticketingSystemWork() {
    this.ticketingSystem.bookTickets();
    this.ticketingSystem.confirmBooking();
  }
}

// Usage
const cinema = new CinemaFacade();
const customer1 = new Customer("Alice");
const customer2 = new Customer("Bob");

customer1.requestMovie(cinema.getMovie(MovieType.ACTION));
cinema.bookTickets(customer1);

customer2.requestMovie(cinema.getMovie(MovieType.COMEDY));
cinema.bookTickets(customer2);

customer1.watchMovie();
customer2.watchMovie();
