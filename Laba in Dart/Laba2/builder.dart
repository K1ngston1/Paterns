enum TicketType {
  standard,
  child,
  vip,
}

enum CinemaType {
  main,
  small,
  medium,
}

enum SessionType {
  standard2D,
  imax3D,
  dolbyAtmos,
}

enum BookingStatus {
  available,
  reserved,
  sold,
}

enum MovieSessionTime {
  morning,
  afternoon,
  evening,
  night,
}

class CinemaBase {
  final CinemaType name;
  int cost;
  final TicketType type;
  BookingStatus status;

  CinemaBase({
    required this.name,
    required this.cost,
    required this.type,
    this.status = BookingStatus.available,
  });

  void reserve() {
    if (status == BookingStatus.available) {
      status = BookingStatus.reserved;
    }
  }

  void sell() {
    if (status == BookingStatus.reserved) {
      status = BookingStatus.sold;
    }
  }

  void updateCost(int newCost) {
    cost = newCost;
  }

  CinemaBase clone() {
    return CinemaBase(
      name: this.name,
      cost: this.cost,
      type: this.type,
      status: this.status,
    );
  }

  @override
  String toString() {
    return 'Ticket Price: $cost, Type: ${type.toString().split('.').last}, Status: ${status.toString().split('.').last}\n';
  }
}
