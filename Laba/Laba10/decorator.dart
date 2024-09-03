abstract class ITicketBase {
  int cost();
}

class BaseTicket implements ITicketBase {
  final int _cost;
  BaseTicket(this._cost);
  @override
  int cost() => _cost;
}

abstract class ITicketDecorator implements ITicketBase {
  String description();
}

class StandardTicket implements ITicketDecorator {
  final ITicketBase _wrapper;
  final int _cost;
  StandardTicket(this._cost, this._wrapper);

  @override
  String description() => 'Standard Ticket';

  @override
  int cost() => _cost + _wrapper.cost();
}

class VIPticket implements ITicketDecorator {
  final ITicketBase _wrapper;
  final int _cost;
  VIPticket(this._cost, this._wrapper);

  @override
  String description() => 'VIP Ticket';

  @override
  int cost() => _cost + _wrapper.cost();
}

class ChildTicket implements ITicketDecorator {
  final ITicketBase _wrapper;
  final int _cost;
  ChildTicket(this._cost, this._wrapper);

  @override
  String description() => 'Child Ticket';

  @override
  int cost() => _cost + _wrapper.cost();
}

void printTicketInfo(ITicketDecorator ticket) {
  print('Ticket Type: ${ticket.description()} - Cost: ${ticket.cost()}');
}

void main() {
  var baseTicket = BaseTicket(5);
  print('Base ticket cost = ${baseTicket.cost()}');

  var standard = StandardTicket(10, baseTicket);
  printTicketInfo(standard);

  var vip = VIPticket(20, baseTicket);
  printTicketInfo(vip);

  var child = ChildTicket(5, baseTicket);
  printTicketInfo(child);
}
