abstract class Bookable {
  void bookTicket(); // якщо не дотримати isp все в одному інтерфейсі
}

abstract class Payable {
  void payForTicket();
}

class OnlineUser implements Bookable, Payable {
  @override
  void bookTicket() {
    print('Квиток заброньовано.');
  }

  @override
  void payForTicket() {
    print('Квиток оплачено.');
  }
}

class AdminUser implements Bookable {
  @override
  void bookTicket() {
    print('Адміністратор забронював квиток.');
  }
}

void main() {
  Bookable user = OnlineUser();
  user.bookTicket();

  Payable payment = OnlineUser();
  payment.payForTicket();

  Bookable admin = AdminUser();
  admin.bookTicket();
}
