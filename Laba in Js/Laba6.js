class Ticket {
  constructor(session, number, place, cost) {
    this.session = session;
    this.number = number;
    this.place = place;
    this.cost = cost;
    this.baricatted = false;
  }
}

class Session {
  constructor(film, startime, hall) {
    this.film = film;
    this.startime = startime;
    this.hall = hall;
  }
}

class Hall {
  constructor(rows, numbersOfRows) {
    this.rows = rows;
    this.numbersOfRows = numbersOfRows;
  }
}

class BoollTicket {
  constructor(maximumCost) {
    this.maximumCost = maximumCost;
    this._tickets = [];
    this._availableTickets = [];

    // Populate tickets pool
    for (let i = 1; i <= 100; i++) {
      const ticket = new Ticket(
        "Людина павук",
        (i % 6) + 1,
        (i % 50) + 1,
        100.0
      );
      this._tickets.push(ticket);
      this._availableTickets.push(ticket);
    }
  }

  getTicket(session) {
    for (const ticket of this._availableTickets) {
      if (
        ticket.session === session.film &&
        !ticket.baricatted &&
        ticket.cost <= this.maximumCost
      ) {
        ticket.baricatted = true;
        this._availableTickets = this._availableTickets.filter(
          (t) => t !== ticket
        );
        return ticket;
      }
    }
    throw new Error("No available tickets for this session");
  }

  refundTicket(ticket) {
    if (ticket.baricatted) {
      ticket.baricatted = false;
      this._availableTickets.push(ticket);
    }
  }

  getAvailableTicketCount() {
    return this._availableTickets.length;
  }
}

function main() {
  const ticketPool = new BoollTicket(150);
  const hall = new Hall(6, 50);
  const session = new Session(
    "Людина павук",
    new Date(Date.now() + 24 * 60 * 60 * 1000), // 1 day from now
    hall
  );

  try {
    const ticket1 = ticketPool.getTicket(session);
    console.log(`Ticket 1: Row ${ticket1.number}, Seat ${ticket1.place}`);
    console.log(
      `Available tickets after first allocation: ${ticketPool.getAvailableTicketCount()}`
    );

    // Test: Check if ticket is booked
    console.log(`Is ticket1 baricatted? ${ticket1.baricatted}`); // Should be true

    // Test: Refund the ticket
    ticketPool.refundTicket(ticket1);
    console.log("Ticket 1 returned.");
    console.log(
      `Available tickets after return: ${ticketPool.getAvailableTicketCount()}`
    );

    // Test: Check if ticket is available again
    const ticket2 = ticketPool.getTicket(session);
    console.log(`Ticket 2: Row ${ticket2.number}, Seat ${ticket2.place}`);
    console.log(
      `Available tickets after second allocation: ${ticketPool.getAvailableTicketCount()}`
    );
  } catch (e) {
    console.error(`Error: ${e.message}`);
  }
}

main();
