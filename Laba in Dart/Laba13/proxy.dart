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
  List<Object?> get props => [
        movieTitle,
        showTime
      ]; // Changed Object to Object? to handle nullable types
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

/// Proxy ///
abstract class IBooking {
  BookingContext makeBooking(String bookingID, MovieTicket sharedState);
}

class BookingMaker implements IBooking {
  final TicketFlyWeightFactory _flyWeightFactory;

  BookingMaker(this._flyWeightFactory);

  @override
  BookingContext makeBooking(String bookingID, MovieTicket sharedState) {
    var flyWeight = _flyWeightFactory.getFlyWeight(sharedState);
    return BookingContext(bookingID: bookingID, sharedState: flyWeight);
  }
}

class ProxyBookingMaker implements IBooking {
  final BookingMaker _subject;

  ProxyBookingMaker({required BookingMaker subject}) : _subject = subject;

  @override
  BookingContext makeBooking(String bookingID, MovieTicket sharedState) {
    _logging(bookingID, sharedState);
    return _subject.makeBooking(bookingID, sharedState);
  }

  void _logging(String bookingID, MovieTicket sharedState) {
    print('Logging -> Booking ID: $bookingID || Ticket: $sharedState');
  }
}

void main() {
  var flyweightFactory = TicketFlyWeightFactory();
  var bookingMaker = BookingMaker(flyweightFactory);
  var proxyBookingMaker = ProxyBookingMaker(subject: bookingMaker);

  var sharedTicket1 = MovieTicket(movieTitle: 'Avengers', showTime: '7:00 PM');
  var sharedTicket2 = MovieTicket(movieTitle: 'Avengers', showTime: '7:00 PM');

  var booking1 = proxyBookingMaker.makeBooking('Booking1', sharedTicket1);
  var booking2 = proxyBookingMaker.makeBooking('Booking2', sharedTicket2);

  print(booking1);
  print(booking2);

  print('Total unique tickets: ${flyweightFactory.total}');
}
