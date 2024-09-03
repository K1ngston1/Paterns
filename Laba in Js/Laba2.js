class CinemaPrototype {
  constructor({
    name = "Unnamed Cinema",
    cost = 5,
    type = CinemaName.SMALL,
    status = BookingStatus.AVAILABLE,
    cinemaTickets = [],
  } = {}) {
    this.name = name;
    this.cost = cost;
    this.type = type;
    this.status = status;
    this.cinemaTickets = cinemaTickets;
  }

  static fromCinema(cinema) {
    return new CinemaPrototype({
      name: cinema.name,
      cost: cinema.cost,
      type: cinema.type,
      status: cinema.status,
      cinemaTickets: cinema.cinemaTickets.map((ticket) => ticket.clone()),
    });
  }

  clone() {
    return CinemaPrototype.fromCinema(this);
  }

  updateTicketPrice(ticketName, newPrice) {
    this.cinemaTickets.forEach((ticket) => {
      if (ticket.name === ticketName) {
        ticket.updateCost(newPrice);
      }
    });
  }

  toString() {
    let infoStr = `Cinema: ${this.name}\n`;
    infoStr += `Type: ${this.type}\n`;
    infoStr += `Tickets:\n`;

    this.cinemaTickets.forEach((ticket) => {
      infoStr += `- ${ticket.toString()}\n`;
    });

    return infoStr;
  }
}

class CinemaBase {
  constructor({ name, cost, type, status = BookingStatus.AVAILABLE }) {
    this.name = name;
    this.cost = cost;
    this.type = type;
    this.status = status;
  }

  reserve() {
    if (this.status === BookingStatus.AVAILABLE) {
      this.status = BookingStatus.RESERVED;
    }
  }

  sell() {
    if (this.status === BookingStatus.RESERVED) {
      this.status = BookingStatus.SOLD;
    }
  }

  updateCost(newCost) {
    this.cost = newCost;
  }

  clone() {
    return new CinemaBase({
      name: this.name,
      cost: this.cost,
      type: this.type,
      status: this.status,
    });
  }

  toString() {
    return `Ticket Price: ${this.cost}, Type: ${this.type}, Status: ${this.status}\n`;
  }
}

// Enums (represented as objects)
const TicketType = {
  STANDARD: "standard",
  CHILD: "child",
  VIP: "vip",
};

const CinemaName = {
  MAIN: "main",
  SMALL: "small",
  MEDIUM: "medium",
};

const BookingStatus = {
  AVAILABLE: "available",
  RESERVED: "reserved",
  SOLD: "sold",
};

// Main function equivalent
function main() {
  const cinema = new CinemaPrototype({
    name: "My Cinema",
    cinemaTickets: [
      new CinemaBase({
        name: CinemaName.SMALL,
        cost: 100,
        type: TicketType.STANDARD,
      }),
      new CinemaBase({
        name: CinemaName.MAIN,
        cost: 200,
        type: TicketType.VIP,
      }),
    ],
  });

  console.log(cinema.toString());

  console.log("-----".repeat(8) + "New" + "----".repeat(8));

  const newCinema = cinema.clone();
  newCinema.cinemaTickets.push(
    new CinemaBase({
      name: CinemaName.MEDIUM,
      cost: 150,
      type: TicketType.CHILD,
    })
  );

  console.log(newCinema.toString());
  console.log("------".repeat(8) + "Old" + "----".repeat(8));
  console.log(cinema.toString());
}

main();
