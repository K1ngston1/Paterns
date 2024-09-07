// Abstract class for TicketSystem
class TicketSystem {
  createAvailableMoviesIterator() {
    throw new Error("Method not implemented");
  }

  createBookedTicketsIterator() {
    throw new Error("Method not implemented");
  }
}

// Abstract class for TicketIterator
class TicketIterator {
  getNext() {
    throw new Error("Method not implemented");
  }

  hasMore() {
    throw new Error("Method not implemented");
  }
}

// MovieTheater class implementing TicketSystem
class MovieTheater extends TicketSystem {
  createAvailableMoviesIterator() {
    return new MovieIterator(this, 0, "available_movies");
  }

  createBookedTicketsIterator() {
    return new MovieIterator(this, 0, "booked_tickets");
  }
}

// MovieIterator class implementing TicketIterator
class MovieIterator extends TicketIterator {
  constructor(movieTheater, currentPosition, profileId) {
    super();
    this._cache = Array.from(
      { length: 5 },
      (_, index) => `${profileId} Item ${index}`
    );
    this.movieTheater = movieTheater;
    this._currentPosition = currentPosition;
  }

  getNext() {
    if (this.hasMore()) {
      console.log(this._cache[this._currentPosition]);
      this._currentPosition++;
      return true;
    }
    return false;
  }

  hasMore() {
    return this._currentPosition < this._cache.length;
  }
}

// BookingSystem class
class BookingSystem {
  constructor(systemId, notifier) {
    this.systemId = systemId;
    this.notifier = notifier;
  }

  notifyAvailableMovies(iterator) {
    while (iterator.hasMore()) {
      iterator.getNext();
    }
  }

  notifyBookedTickets(iterator) {
    while (iterator.hasMore()) {
      iterator.getNext();
    }
  }
}

function main() {
  const movieTheater = new MovieTheater();
  const bookingSystem = new BookingSystem(1, "NotifierBot");

  const availableMoviesIterator = movieTheater.createAvailableMoviesIterator();
  const bookedTicketsIterator = movieTheater.createBookedTicketsIterator();

  bookingSystem.notifyAvailableMovies(availableMoviesIterator);
  bookingSystem.notifyBookedTickets(bookedTicketsIterator);
}

// Run the main function
main();
