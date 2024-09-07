abstract class TicketSystem {
  TicketIterator createAvailableMoviesIterator();
  TicketIterator createBookedTicketsIterator();
}

abstract class TicketIterator {
  bool getNext();
  bool hasMore();
}

class MovieTheater implements TicketSystem {
  @override
  TicketIterator createAvailableMoviesIterator() {
    return MovieIterator(this, 0, profileId: 'available_movies');
  }

  @override
  TicketIterator createBookedTicketsIterator() {
    return MovieIterator(this, 0, profileId: 'booked_tickets');
  }
}

class MovieIterator implements TicketIterator {
  final List<String> _cache = [];
  final String profileId;
  final MovieTheater movieTheater;
  int _currentPosition;

  MovieIterator(
    this.movieTheater,
    this._currentPosition, {
    required this.profileId,
  }) {
    _cache.addAll(List.generate(5, (index) => '$profileId Item $index'));
  }

  @override
  bool getNext() {
    if (hasMore()) {
      print(_cache[_currentPosition]);
      _currentPosition++;
      return true;
    }
    return false;
  }

  @override
  bool hasMore() {
    return _currentPosition < _cache.length;
  }
}

class BookingSystem {
  final int systemId;
  final String notifier;

  BookingSystem({
    required this.systemId,
    required this.notifier,
  });

  void notifyAvailableMovies(TicketIterator iterator) {
    while (iterator.hasMore()) {
      iterator.getNext();
    }
  }

  void notifyBookedTickets(TicketIterator iterator) {
    while (iterator.hasMore()) {
      iterator.getNext();
    }
  }
}

void main() {
  final movieTheater = MovieTheater();
  final bookingSystem = BookingSystem(systemId: 1, notifier: 'NotifierBot');

  final availableMoviesIterator = movieTheater.createAvailableMoviesIterator();
  final bookedTicketsIterator = movieTheater.createBookedTicketsIterator();

  bookingSystem.notifyAvailableMovies(availableMoviesIterator);
  bookingSystem.notifyBookedTickets(bookedTicketsIterator);
}
