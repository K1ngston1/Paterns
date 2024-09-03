enum MovieType { action, comedy, drama }

abstract class IMovie {
  String getMovieName();
}

class ActionMovie implements IMovie {
  @override
  String getMovieName() => 'Action Movie';
}

class ComedyMovie implements IMovie {
  @override
  String getMovieName() => 'Comedy Movie';
}

class DramaMovie implements IMovie {
  @override
  String getMovieName() => 'Drama Movie';
}

abstract class ICustomer {
  void requestMovie(IMovie movie);
  Map<int, String> selectSeats();
  void watchMovie();
  String getName();
}

class TicketingSystem {
  void bookTickets() {
    print('The tickets are being booked');
  }

  void confirmBooking() {
    print('Booking confirmed');
  }
}

class Clerk {
  void acceptBooking(ICustomer customer) {
    print('Clerk accepted the booking from ${customer.getName()}');
  }

  void processBooking() {
    print('Processing booking in the system');
  }

  void deliverTickets(ICustomer customer) {
    print(
        'Tickets are ready, delivering to the customer ${customer.getName()}');
  }
}

class Customer implements ICustomer {
  final String name;

  Customer({
    required this.name,
  });

  @override
  void watchMovie() {
    print('Customer $name starts watching the movie');
  }

  @override
  Map<int, String> selectSeats() {
    print('Customer $name selects seats');
    return <int, String>{1: 'A1', 2: 'A2'};
  }

  @override
  String getName() => name;

  @override
  void requestMovie(IMovie movie) {
    print('Customer $name checks the details of ${movie.getMovieName()}');
  }
}

class CinemaFacade {
  final TicketingSystem _ticketingSystem;
  final Clerk _clerk;
  final Map<MovieType, IMovie> _movies;

  CinemaFacade()
      : _ticketingSystem = TicketingSystem(),
        _clerk = Clerk(),
        _movies = <MovieType, IMovie>{
          MovieType.action: ActionMovie(),
          MovieType.comedy: ComedyMovie(),
          MovieType.drama: DramaMovie(),
        };

  IMovie getMovie(MovieType type) {
    return _movies[type]!;
  }

  void bookTickets(ICustomer customer) {
    _clerk.acceptBooking(customer);
    _clerk.processBooking();
    _ticketingSystemWork();
    _clerk.deliverTickets(customer);
  }

  void _ticketingSystemWork() {
    _ticketingSystem.bookTickets();
    _ticketingSystem.confirmBooking();
  }
}

void main() {
  var cinema = CinemaFacade();
  var customer1 = Customer(name: 'Alice');
  var customer2 = Customer(name: 'Bob');
  customer1.requestMovie(cinema.getMovie(MovieType.action));
  cinema.bookTickets(customer1);
  customer2.requestMovie(cinema.getMovie(MovieType.comedy));
  cinema.bookTickets(customer2);
  customer1.watchMovie();
  customer2.watchMovie();
}
