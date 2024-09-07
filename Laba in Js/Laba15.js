// Command interface
class ICommand {
  execute() {}
}

// Cinema entities
class Movie {
  constructor(title, showtimes) {
    this.title = title;
    this.showtimes = showtimes;
  }

  showMovieDetails() {
    console.log(`Movie: ${this.title}`);
    console.log(`Available showtimes: ${this.showtimes.join(", ")}`);
  }
}

class User {
  constructor(name) {
    this.name = name;
  }

  browseMovies(movies) {
    console.log(`${this.name} is browsing movies`);
    movies.forEach((movie) => movie.showMovieDetails());
  }

  selectShowtime(movie, showtime) {
    console.log(`${this.name} selected ${showtime} for movie ${movie.title}`);
  }

  makePayment() {
    console.log(`${this.name} is making payment`);
  }
}

class BookingSystem {
  confirmBooking() {
    console.log("Booking confirmed");
  }

  cancelBooking() {
    console.log("Booking cancelled");
  }
}

// Commands
class BrowseMoviesCommand extends ICommand {
  constructor(user, movies) {
    super();
    this.user = user;
    this.movies = movies;
  }

  execute() {
    this.user.browseMovies(this.movies);
  }
}

class SelectShowtimeCommand extends ICommand {
  constructor(user, movie, showtime) {
    super();
    this.user = user;
    this.movie = movie;
    this.showtime = showtime;
  }

  execute() {
    this.user.selectShowtime(this.movie, this.showtime);
  }
}

class MakePaymentCommand extends ICommand {
  constructor(user) {
    super();
    this.user = user;
  }

  execute() {
    this.user.makePayment();
  }
}

class ConfirmBookingCommand extends ICommand {
  constructor(bookingSystem) {
    super();
    this.bookingSystem = bookingSystem;
  }

  execute() {
    this.bookingSystem.confirmBooking();
  }
}

// History Manager
class BookingProcess {
  constructor() {
    this.history = [];
  }

  addCommand(command) {
    this.history.push(command);
  }

  completeBooking() {
    if (this.history.length > 0) {
      this.history.forEach((command) => command.execute());
    } else {
      console.log("No actions to execute");
    }
    this.history = []; // Clear the history after execution
  }
}

// Example usage
const main = () => {
  const user = new User("Alice");
  const movie1 = new Movie("Inception", ["14:00", "18:00", "21:00"]);
  const movie2 = new Movie("Interstellar", ["15:00", "19:00", "22:00"]);

  const bookingProcess = new BookingProcess();

  // Browse available movies
  bookingProcess.addCommand(new BrowseMoviesCommand(user, [movie1, movie2]));

  // Select showtime for a movie
  bookingProcess.addCommand(new SelectShowtimeCommand(user, movie1, "18:00"));

  // Make payment
  bookingProcess.addCommand(new MakePaymentCommand(user));

  // Confirm booking
  const bookingSystem = new BookingSystem();
  bookingProcess.addCommand(new ConfirmBookingCommand(bookingSystem));

  // Execute all actions in the process
  bookingProcess.completeBooking();
};

// Run the example
main();
