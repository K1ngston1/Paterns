// Enum to represent different ticket types
const TicketType = {
  REGULAR: "regular",
  VIP: "vip",
  STUDENT: "student",
  NONE: "none",
};

// RequestBooking class to represent the booking request
class RequestBooking {
  constructor(description, ticketType) {
    this._description = description;
    this._ticketType = ticketType;
  }

  get description() {
    return this._description;
  }

  get ticketType() {
    return this._ticketType;
  }
}

// Abstract Handler class
class Handler {
  constructor(successor = null) {
    this._successor = successor;
  }

  handle(request) {
    const result = this._checkRequest(request.ticketType);
    if (!result && this._successor !== null) {
      this._successor.handle(request);
    }
  }

  _checkRequest(ticketType) {
    throw new Error("_checkRequest method must be implemented");
  }
}

// TicketSellerHandler checks the availability of tickets
class TicketSellerHandler extends Handler {
  _checkRequest(ticketType) {
    const available = ticketType !== TicketType.NONE;
    if (available) {
      console.log("TicketSeller processes the ticket request");
    } else {
      console.log("TicketSeller rejects the booking request");
    }
    return !available;
  }
}

// PaymentHandler processes the payment
class PaymentHandler extends Handler {
  _checkRequest(ticketType) {
    const paymentProcessed = [
      TicketType.REGULAR,
      TicketType.VIP,
      TicketType.STUDENT,
    ].includes(ticketType);
    if (paymentProcessed) {
      console.log("Payment is being processed");
    } else {
      console.log("Payment failed or invalid ticket type");
    }
    return !paymentProcessed;
  }
}

// BookingConfirmationHandler confirms the booking
class BookingConfirmationHandler extends Handler {
  _checkRequest(ticketType) {
    const confirmed = [
      TicketType.REGULAR,
      TicketType.VIP,
      TicketType.STUDENT,
    ].includes(ticketType);
    if (confirmed) {
      console.log("Booking confirmed! Enjoy your movie.");
    } else {
      console.log("Booking confirmation failed");
    }
    return !confirmed;
  }
}

// Main function to run the process
function main() {
  // Create the handlers and link them
  const bookingConfirmation = new BookingConfirmationHandler();
  const payment = new PaymentHandler(bookingConfirmation);
  const ticketSeller = new TicketSellerHandler(payment);

  // Create a booking request
  const requestDescription = ["Movie: Inception", "Showtime: 18:00"];
  const requestBooking = new RequestBooking(
    requestDescription,
    TicketType.REGULAR
  );

  // Start the chain of responsibility
  ticketSeller.handle(requestBooking);
}

// Run the main function
main();
