enum TicketType {
  standard,
  child,
  vip,
}

enum CinemaName {
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
  final CinemaName name;
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

  @override
  String toString() {
    return 'Ціна квитка: ${cost.toString()} (without decimals), Type: ${type.toString().split('.').last}\n';
  }
}
