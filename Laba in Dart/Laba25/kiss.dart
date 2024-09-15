// ignore_for_file: public_member_api_docs, sort_constructors_first
class Client {
  late String _name;
  late String _email;

  get name => this._name;
  get email => this._email;

  Client(
    this._name,
    this._email,
  );
}

class Cinema {
  late String _name;
  late double _price;

  get name => this._name;
  get price => this._price;

  Cinema(
    this._name,
    this._price,
  );
}

class Booking {
  Client _client;
  Cinema _cinema;
  DateTime _bookingDate;

  Client get client => _client;
  Cinema get cinema => _cinema;
  DateTime get bookingDate => _bookingDate;

  Booking(
    this._client,
    this._cinema,
  ) : _bookingDate = DateTime.now();

  void showBookingDate() {
    print('Бронювання:');
    print('Клієнт: ${client.name}');
    print('Електронна пошта: ${client.email}');
    print('Кінотеатр: ${cinema.name}');
    print('Ціна: \$${cinema.price}');
    print('Дата бронювання: $bookingDate');
  }
}

void main() {
  Client client1 = Client("Олег", "oleg@gmail.com");
  Cinema cinema1 = Cinema("Палац", 45);
  Booking booking1 = Booking(client1, cinema1);
  booking1.showBookingDate();
}
