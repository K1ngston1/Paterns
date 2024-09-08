class BookingState {
  handle(context) {
    throw new Error("This method should be overridden!");
  }

  toString() {
    return "Booking State";
  }
}

class MovieSelection extends BookingState {
  handle(context) {
    console.log("Movie selected! Moving to seat selection.");
    context.state = new SeatSelection();
  }

  toString() {
    return "Selecting Movie";
  }
}

class SeatSelection extends BookingState {
  handle(context) {
    console.log("Seats selected! Moving to payment confirmation.");
    context.state = new PaymentConfirmation();
  }

  toString() {
    return "Selecting Seats";
  }
}

class PaymentConfirmation extends BookingState {
  handle(context) {
    console.log("Payment confirmed! Booking complete.");
    context.state = new BookingComplete();
  }

  toString() {
    return "Confirming Payment";
  }
}

class BookingComplete extends BookingState {
  handle(context) {
    console.log("Booking is already complete.");
  }

  toString() {
    return "Booking Complete";
  }
}

class BookingContext {
  constructor(state) {
    this._state = state;
  }

  get state() {
    return this._state;
  }

  set state(newState) {
    this._state = newState;
  }

  nextStep() {
    console.log("Proceeding to the next step...");
    this._state.handle(this);
  }
}

function main() {
  const booking = new BookingContext(new MovieSelection());

  console.log(`Current state: ${booking.state}`);
  booking.nextStep();

  console.log(`Current state: ${booking.state}`);
  booking.nextStep();

  console.log(`Current state: ${booking.state}`);
  booking.nextStep();

  console.log(`Current state: ${booking.state}`);
}

main();
