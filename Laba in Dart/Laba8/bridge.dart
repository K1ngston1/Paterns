class Movie {
  final String title;
  final int duration;
  final String genre;

  Movie(this.title, this.duration, this.genre);
}

class Showtime {
  final Movie movie;
  final DateTime time;
  final int availableSeats;
  bool _isSoldOut = false;

  Showtime(this.movie, this.time, this.availableSeats);

  bool get isSoldOut => _isSoldOut;

  void markSoldOut() => _isSoldOut = true;
}

abstract class ITicketSalesImplementor {
  void sellTicket(Showtime showtime);
  void cancelTicket(Showtime showtime);
  int getAvailableSeats(Showtime showtime);
  String getSalesMethod();
}

// In-person ticket sales implementation.
class BoxOfficeSalesImplementor implements ITicketSalesImplementor {
  final String salesMethod = 'BoxOffice';
  Map<Showtime, int> seats = {};

  BoxOfficeSalesImplementor(List<Showtime> showtimes) {
    for (var showtime in showtimes) {
      seats[showtime] = showtime.availableSeats;
    }
  }

  @override
  void sellTicket(Showtime showtime) {
    if (seats[showtime]! > 0) {
      seats[showtime] = seats[showtime]! - 1;
      print('Ticket sold at box office for ${showtime.movie.title}');
      if (seats[showtime] == 0) {
        showtime.markSoldOut();
      }
    } else {
      print('Tickets are sold out for this showtime.');
    }
  }

  @override
  void cancelTicket(Showtime showtime) {
    if (seats[showtime]! < showtime.availableSeats) {
      seats[showtime] = seats[showtime]! + 1;
      print('Ticket cancelled at box office for ${showtime.movie.title}');
    }
  }

  @override
  int getAvailableSeats(Showtime showtime) {
    return seats[showtime] ?? 0;
  }

  @override
  String getSalesMethod() {
    return salesMethod;
  }
}

// Online ticket sales implementation.
class OnlineSalesImplementor implements ITicketSalesImplementor {
  final String salesMethod = 'Online';
  Map<Showtime, int> seats = {};

  OnlineSalesImplementor(List<Showtime> showtimes) {
    for (var showtime in showtimes) {
      seats[showtime] = showtime.availableSeats;
    }
  }

  @override
  void sellTicket(Showtime showtime) {
    if (seats[showtime]! > 0) {
      seats[showtime] = seats[showtime]! - 1;
      print('Ticket sold online for ${showtime.movie.title}');
      if (seats[showtime] == 0) {
        showtime.markSoldOut();
      }
    } else {
      print('Tickets are sold out for this showtime.');
    }
  }

  @override
  void cancelTicket(Showtime showtime) {
    if (seats[showtime]! < showtime.availableSeats) {
      seats[showtime] = seats[showtime]! + 1;
      print('Ticket cancelled online for ${showtime.movie.title}');
    }
  }

  @override
  int getAvailableSeats(Showtime showtime) {
    return seats[showtime] ?? 0;
  }

  @override
  String getSalesMethod() {
    return salesMethod;
  }
}

class CinemaTicketSystem {
  ITicketSalesImplementor _ticketSales;

  CinemaTicketSystem(this._ticketSales);

  void sellTicket(Showtime showtime) {
    if (!showtime.isSoldOut) {
      _ticketSales.sellTicket(showtime);
    } else {
      print('Cannot sell ticket; showtime is sold out.');
    }
  }

  void cancelTicket(Showtime showtime) {
    _ticketSales.cancelTicket(showtime);
  }

  int getAvailableSeats(Showtime showtime) {
    return _ticketSales.getAvailableSeats(showtime);
  }

  void changeSalesImplementor(ITicketSalesImplementor newImplementor) {
    print(
        'Sales implementor changed from ${_ticketSales.getSalesMethod()} to ${newImplementor.getSalesMethod()}');
    _ticketSales = newImplementor;
  }

  String getSalesMethod() {
    return _ticketSales.getSalesMethod();
  }
}

void main(List<String> arguments) {
  var movie1 = Movie("Inception", 148, "Sci-Fi");
  var movie2 = Movie("Titanic", 195, "Drama");

  var showtime1 = Showtime(movie1, DateTime(2024, 9, 1, 20, 0), 100);
  var showtime2 = Showtime(movie2, DateTime(2024, 9, 1, 22, 0), 50);

  var implementor = BoxOfficeSalesImplementor([showtime1, showtime2]);
  var ticketSystem = CinemaTicketSystem(implementor);

  print('Sales method: ${ticketSystem.getSalesMethod()}');
  ticketSystem.sellTicket(showtime1);
  ticketSystem.sellTicket(showtime2);

  print(
      'Available seats for ${showtime1.movie.title}: ${ticketSystem.getAvailableSeats(showtime1)}');
  print(
      'Available seats for ${showtime2.movie.title}: ${ticketSystem.getAvailableSeats(showtime2)}');

  var newImplementor = OnlineSalesImplementor([showtime1, showtime2]);
  ticketSystem.changeSalesImplementor(newImplementor);

  print('Sales method: ${ticketSystem.getSalesMethod()}');
  ticketSystem.sellTicket(showtime1);
  ticketSystem.sellTicket(showtime2);

  print(
      'Available seats for ${showtime1.movie.title}: ${ticketSystem.getAvailableSeats(showtime1)}');
  print(
      'Available seats for ${showtime2.movie.title}: ${ticketSystem.getAvailableSeats(showtime2)}');
}
