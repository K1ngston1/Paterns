// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ICommand {
  void execute();
}

class Movie {
  final String title;
  final List<String> showtimes;

  Movie(this.title, this.showtimes);

  void showMovieDetails() {
    print('Movie: $title');
    print('Available showtimes: $showtimes');
  }
}

class User {
  final String name;

  User(this.name);

  void browseMovies(List<Movie> movies) {
    print('$name is browsing movies');
    movies.forEach((movie) => movie.showMovieDetails());
  }

  void selectShowtime(Movie movie, String showtime) {
    print('$name selected $showtime for movie ${movie.title}');
  }

  void makePayment() {
    print('$name is making payment');
  }
}

class BookingSystem {
  void confirmBooking() {
    print('Booking confirmed');
  }

  void cancelBooking() {
    print('Booking cancelled');
  }
}

// Commands
class BrowseMoviesCommand implements ICommand {
  final User executor;
  final List<Movie> movies;

  BrowseMoviesCommand({
    required this.executor,
    required this.movies,
  });

  @override
  void execute() {
    executor.browseMovies(movies);
  }
}

class SelectShowtimeCommand implements ICommand {
  final User executor;
  final Movie movie;
  final String showtime;

  SelectShowtimeCommand({
    required this.executor,
    required this.movie,
    required this.showtime,
  });

  @override
  void execute() {
    executor.selectShowtime(movie, showtime);
  }
}

class MakePaymentCommand implements ICommand {
  final User executor;

  MakePaymentCommand({
    required this.executor,
  });

  @override
  void execute() {
    executor.makePayment();
  }
}

class ConfirmBookingCommand implements ICommand {
  final BookingSystem executor;

  ConfirmBookingCommand({
    required this.executor,
  });

  @override
  void execute() {
    executor.confirmBooking();
  }
}

// History Manager
class BookingProcess {
  var history = <ICommand>[];

  void addCommand(ICommand command) {
    history.add(command);
  }

  void completeBooking() {
    if (history.isNotEmpty) {
      history.forEach((element) {
        element.execute();
      });
    } else {
      print('No actions to execute');
    }
    history.clear();
  }
}

void main() {
  var user = User('Alice');
  var movie1 = Movie('Inception', ['14:00', '18:00', '21:00']);
  var movie2 = Movie('Interstellar', ['15:00', '19:00', '22:00']);

  var bookingProcess = BookingProcess();
  bookingProcess.addCommand(
      BrowseMoviesCommand(executor: user, movies: [movie1, movie2]));

  bookingProcess.addCommand(
      SelectShowtimeCommand(executor: user, movie: movie1, showtime: '18:00'));
  bookingProcess.addCommand(MakePaymentCommand(executor: user));

  var bookingSystem = BookingSystem();
  bookingProcess.addCommand(ConfirmBookingCommand(executor: bookingSystem));

  bookingProcess.completeBooking();
}
