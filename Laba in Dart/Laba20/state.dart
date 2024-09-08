abstract class BookingState {
  void handle(BookingContext context);
  String toString();
}

class MovieSelection implements BookingState {
  @override
  void handle(BookingContext context) {
    print("Movie selected! Moving to seat selection.");
    context.state = SeatSelection();
  }

  @override
  String toString() {
    return "Selecting Movie";
  }
}

class SeatSelection implements BookingState {
  @override
  void handle(BookingContext context) {
    print("Seats selected! Moving to payment confirmation.");
    context.state = PaymentConfirmation();
  }

  @override
  String toString() {
    return "Selecting Seats";
  }
}

class PaymentConfirmation implements BookingState {
  @override
  void handle(BookingContext context) {
    print("Payment confirmed! Booking complete.");
    context.state = BookingComplete();
  }

  @override
  String toString() {
    return "Confirming Payment";
  }
}

class BookingComplete implements BookingState {
  @override
  void handle(BookingContext context) {
    print("Booking is already complete.");
  }

  @override
  String toString() {
    return "Booking Complete";
  }
}

class BookingContext {
  BookingState _state;

  BookingContext(this._state);

  BookingState get state => _state;
  set state(BookingState newState) => _state = newState;

  void nextStep() {
    print("Proceeding to the next step...");
    _state.handle(this);
  }
}

void main() {
  var booking = BookingContext(MovieSelection());

  print("Current state: ${booking.state}");
  booking.nextStep();

  print("Current state: ${booking.state}");
  booking.nextStep();

  print("Current state: ${booking.state}");
  booking.nextStep();

  print("Current state: ${booking.state}");
}
