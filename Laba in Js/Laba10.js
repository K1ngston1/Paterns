class TicketBase {
  constructor(cost) {
    this._cost = cost;
  }

  cost() {
    return this._cost;
  }
}

class TicketDecorator {
  constructor(ticketBase) {
    this._ticketBase = ticketBase;
  }

  cost() {
    return this._ticketBase.cost();
  }

  description() {
    return "Unknown Ticket Type";
  }
}

class StandardTicket extends TicketDecorator {
  constructor(cost, ticketBase) {
    super(ticketBase);
    this._cost = cost;
  }

  cost() {
    return this._ticketBase.cost() + this._cost;
  }

  description() {
    return "Standard Ticket";
  }
}

class VIPticket extends TicketDecorator {
  constructor(cost, ticketBase) {
    super(ticketBase);
    this._cost = cost;
  }

  cost() {
    return this._ticketBase.cost() + this._cost;
  }

  description() {
    return "VIP Ticket";
  }
}

class ChildTicket extends TicketDecorator {
  constructor(cost, ticketBase) {
    super(ticketBase);
    this._cost = cost;
  }

  cost() {
    return this._ticketBase.cost() + this._cost;
  }

  description() {
    return "Child Ticket";
  }
}

function printTicketInfo(ticket) {
  console.log(`Ticket Type: ${ticket.description()} - Cost: ${ticket.cost()}`);
}

// Main function to demonstrate usage
function main() {
  const baseTicket = new TicketBase(5); // base cost for any ticket
  console.log(`Base ticket cost = ${baseTicket.cost()}`);

  const standard = new StandardTicket(10, baseTicket);
  printTicketInfo(standard);

  const vip = new VIPticket(20, baseTicket);
  printTicketInfo(vip);

  const child = new ChildTicket(5, baseTicket);
  printTicketInfo(child);
}

main();
