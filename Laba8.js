// Represents a movie in the cinema
class Movie {
  constructor(title, duration, genre) {
    this.title = title;
    this.duration = duration; // in minutes
    this.genre = genre;
  }
}

// Represents a showtime for a movie
class Showtime {
  constructor(movie, time, availableSeats) {
    this.movie = movie;
    this.time = time;
    this.availableSeats = availableSeats;
    this.isSoldOut = false;
  }

  markSoldOut() {
    this.isSoldOut = true;
  }
}

// Interface for ticket sales operations
class ITicketSalesImplementor {
  sellTicket(showtime) {
    throw new Error("Method 'sellTicket()' must be implemented.");
  }
  cancelTicket(showtime) {
    throw new Error("Method 'cancelTicket()' must be implemented.");
  }
  getAvailableSeats(showtime) {
    throw new Error("Method 'getAvailableSeats()' must be implemented.");
  }
  getSalesMethod() {
    throw new Error("Method 'getSalesMethod()' must be implemented.");
  }
}

// In-person ticket sales implementation
class BoxOfficeSalesImplementor extends ITicketSalesImplementor {
  constructor(showtimes) {
    super();
    this.salesMethod = "BoxOffice";
    this.seats = new Map();

    showtimes.forEach((showtime) => {
      this.seats.set(showtime, showtime.availableSeats);
    });
  }

  sellTicket(showtime) {
    if (this.seats.get(showtime) > 0) {
      this.seats.set(showtime, this.seats.get(showtime) - 1);
      console.log(`Ticket sold at box office for ${showtime.movie.title}`);
      if (this.seats.get(showtime) === 0) {
        showtime.markSoldOut();
      }
    } else {
      console.log("Tickets are sold out for this showtime.");
    }
  }

  cancelTicket(showtime) {
    if (this.seats.get(showtime) < showtime.availableSeats) {
      this.seats.set(showtime, this.seats.get(showtime) + 1);
      console.log(`Ticket cancelled at box office for ${showtime.movie.title}`);
    }
  }

  getAvailableSeats(showtime) {
    return this.seats.get(showtime) || 0;
  }

  getSalesMethod() {
    return this.salesMethod;
  }
}

// Online ticket sales implementation
class OnlineSalesImplementor extends ITicketSalesImplementor {
  constructor(showtimes) {
    super();
    this.salesMethod = "Online";
    this.seats = new Map();

    showtimes.forEach((showtime) => {
      this.seats.set(showtime, showtime.availableSeats);
    });
  }

  sellTicket(showtime) {
    if (this.seats.get(showtime) > 0) {
      this.seats.set(showtime, this.seats.get(showtime) - 1);
      console.log(`Ticket sold online for ${showtime.movie.title}`);
      if (this.seats.get(showtime) === 0) {
        showtime.markSoldOut();
      }
    } else {
      console.log("Tickets are sold out for this showtime.");
    }
  }

  cancelTicket(showtime) {
    if (this.seats.get(showtime) < showtime.availableSeats) {
      this.seats.set(showtime, this.seats.get(showtime) + 1);
      console.log(`Ticket cancelled online for ${showtime.movie.title}`);
    }
  }

  getAvailableSeats(showtime) {
    return this.seats.get(showtime) || 0;
  }

  getSalesMethod() {
    return this.salesMethod;
  }
}

// Manages ticket sales using different sales methods
class CinemaTicketSystem {
  constructor(ticketSalesImplementor) {
    this._ticketSales = ticketSalesImplementor;
  }

  sellTicket(showtime) {
    if (!showtime.isSoldOut) {
      this._ticketSales.sellTicket(showtime);
    } else {
      console.log("Cannot sell ticket; showtime is sold out.");
    }
  }

  cancelTicket(showtime) {
    this._ticketSales.cancelTicket(showtime);
  }

  getAvailableSeats(showtime) {
    return this._ticketSales.getAvailableSeats(showtime);
  }

  changeSalesImplementor(newImplementor) {
    console.log(
      `Sales implementor changed from ${this._ticketSales.getSalesMethod()} to ${newImplementor.getSalesMethod()}`
    );
    this._ticketSales = newImplementor;
  }

  getSalesMethod() {
    return this._ticketSales.getSalesMethod();
  }
}

// Example usage
function main() {
  const movie1 = new Movie("Inception", 148, "Sci-Fi");
  const movie2 = new Movie("Titanic", 195, "Drama");

  const showtime1 = new Showtime(movie1, new Date(2024, 8, 1, 20, 0), 100);
  const showtime2 = new Showtime(movie2, new Date(2024, 8, 1, 22, 0), 50);

  const implementor = new BoxOfficeSalesImplementor([showtime1, showtime2]);
  const ticketSystem = new CinemaTicketSystem(implementor);

  console.log(`Sales method: ${ticketSystem.getSalesMethod()}`);
  ticketSystem.sellTicket(showtime1);
  ticketSystem.sellTicket(showtime2);

  console.log(
    `Available seats for ${
      showtime1.movie.title
    }: ${ticketSystem.getAvailableSeats(showtime1)}`
  );
  console.log(
    `Available seats for ${
      showtime2.movie.title
    }: ${ticketSystem.getAvailableSeats(showtime2)}`
  );

  const newImplementor = new OnlineSalesImplementor([showtime1, showtime2]);
  ticketSystem.changeSalesImplementor(newImplementor);

  console.log(`Sales method: ${ticketSystem.getSalesMethod()}`);
  ticketSystem.sellTicket(showtime1);
  ticketSystem.sellTicket(showtime2);

  console.log(
    `Available seats for ${
      showtime1.movie.title
    }: ${ticketSystem.getAvailableSeats(showtime1)}`
  );
  console.log(
    `Available seats for ${
      showtime2.movie.title
    }: ${ticketSystem.getAvailableSeats(showtime2)}`
  );
}

main();
