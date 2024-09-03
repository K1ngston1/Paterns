// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart'; // Import the Equatable package for the Equtable class

class MovieTicket extends Equatable {
  final String movieTitle;
  final String showTime;

  MovieTicket({
    required this.movieTitle,
    required this.showTime,
  });

  MovieTicket.fromTicket(MovieTicket sharedState)
      : this(
            movieTitle: sharedState.movieTitle, showTime: sharedState.showTime);

  @override
  String toString() {
    return '($movieTitle, $showTime)';
  }

  @override
  List<Object?> get props => [movieTitle, showTime];
}

class BookingContext {
  final String bookingID;
  final MovieTicket sharedState;

  BookingContext({
    required this.bookingID,
    required this.sharedState,
  });

  @override
  String toString() {
    return 'Booking ID: $bookingID || Ticket: $sharedState';
  }
}

class TicketFlyWeightFactory {
  var flyweights =
      <MovieTicket?>[]; // Changed name from flyweight to flyweights for clarity

  MovieTicket getFlyWeight(MovieTicket sharedState) {
    var state = flyweights.firstWhere(
      (element) => sharedState == element,
      orElse: () => null,
    );

    if (state == null) {
      state = sharedState;
      flyweights.add(sharedState);
    }

    return state;
  }

  int get total => flyweights.length; // Changed total to use flyweights
}

class CinemaOrderMarket {
  final String uniqueState;
  final MovieTicket sharedState;

  CinemaOrderMarket(this.uniqueState, this.sharedState);

  static CinemaOrderMarket makeCinemaOrder(String uniqueState,
      MovieTicket sharedState, TicketFlyWeightFactory factory) {
    var flyweight = factory.getFlyWeight(sharedState);
    return CinemaOrderMarket(uniqueState, flyweight);
  }

  @override
  String toString() {
    return 'Order for $uniqueState with ticket: $sharedState';
  }
}

void main(List<String> arguments) {
  var flyweightFactory = TicketFlyWeightFactory();

  // Create unique movie tickets with same shared states
  var ticket1 = MovieTicket(movieTitle: 'Avengers', showTime: '18:00');
  var ticket2 = MovieTicket(movieTitle: 'Avengers', showTime: '18:00');
  var ticket3 = MovieTicket(movieTitle: 'Inception', showTime: '20:00');

  var order1 =
      CinemaOrderMarket.makeCinemaOrder('Order001', ticket1, flyweightFactory);
  var order2 =
      CinemaOrderMarket.makeCinemaOrder('Order002', ticket2, flyweightFactory);
  var order3 =
      CinemaOrderMarket.makeCinemaOrder('Order003', ticket3, flyweightFactory);

  print(order1);
  print(order2);
  print(order3);

  // Show the total number of unique flyweights
  print('Total unique tickets: ${flyweightFactory.total}');
}
