const TicketType = {
  Standard: "Standard",
  Premium: "Premium",
  VIP: "VIP",
};

class Ticket {
  constructor(movieName, seatNumber, showTime) {
    if (this.constructor === Ticket) {
      throw new Error("Abstract class Ticket cannot be instantiated directly.");
    }
    this.movieName = movieName;
    this.seatNumber = seatNumber;
    this.showTime = showTime;
  }

  costTicket() {
    throw new Error("Method 'costTicket()' must be implemented.");
  }

  toString() {
    return `Ticket for movie ${this.movieName} at ${this.showTime}, seat ${this.seatNumber}`;
  }
}

class StandardTicket extends Ticket {
  constructor(movieName, seatNumber, showTime, basePrice) {
    super(movieName, seatNumber, showTime);
    this.basePrice = basePrice;
  }

  costTicket() {
    return this.basePrice;
  }
}

// PremiumTicket class
class PremiumTicket extends Ticket {
  constructor(movieName, seatNumber, showTime, basePrice, premiumMultiplier) {
    super(movieName, seatNumber, showTime);
    this.basePrice = basePrice;
    this.premiumMultiplier = premiumMultiplier;
  }

  costTicket() {
    return this.basePrice * this.premiumMultiplier;
  }

  toString() {
    return super.toString() + " with Premium services";
  }
}

class VIPTicket extends Ticket {
  constructor(
    movieName,
    seatNumber,
    showTime,
    basePrice,
    vipMultiplier,
    extraServiceFee
  ) {
    super(movieName, seatNumber, showTime);
    this.basePrice = basePrice;
    this.vipMultiplier = vipMultiplier;
    this.extraServiceFee = extraServiceFee;
  }

  costTicket() {
    return this.basePrice * this.vipMultiplier + this.extraServiceFee;
  }

  toString() {
    return super.toString() + " with VIP services";
  }
}

// TicketFactory class
class TicketFactory {
  static createTicket(ticketType, movieName, seatNumber, showTime) {
    switch (ticketType) {
      case TicketType.Standard:
        return new StandardTicket(movieName, seatNumber, showTime, 10.0);
      case TicketType.Premium:
        return new PremiumTicket(movieName, seatNumber, showTime, 10.0, 1.5);
      case TicketType.VIP:
        return new VIPTicket(movieName, seatNumber, showTime, 10.0, 2.0, 5.0);
      default:
        throw new Error("Invalid ticket type");
    }
  }
}

function main() {
  Object.values(TicketType).forEach((type) => {
    const ticket = TicketFactory.createTicket(type, "Avengers", "A1", "18:00");
    console.log(ticket.toString() + " with cost = $" + ticket.costTicket());
  });
}
main();
