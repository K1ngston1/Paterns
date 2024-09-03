enum PlatformType { Web, Mobile }

abstract class BookingOptions {
  final String platform;
  BookingOptions(this.platform);
  void display();
}

abstract class PaymentMethod {
  final String platform;
  PaymentMethod(this.platform);
  void process();
}

abstract class UserInterface {
  final String platform;
  UserInterface(this.platform);
  void render();
}

class WebBookingOptions extends BookingOptions {
  WebBookingOptions() : super("Web");

  @override
  void display() {
    print('Displaying booking options for $platform');
  }
}

class WebPaymentMethod extends PaymentMethod {
  WebPaymentMethod() : super("Web");

  @override
  void process() {
    print('Processing payment for $platform');
  }
}

class WebUserInterface extends UserInterface {
  WebUserInterface() : super("Web");

  @override
  void render() {
    print('Rendering UI for $platform');
  }
}

class MobileBookingOptions extends BookingOptions {
  MobileBookingOptions() : super("Mobile");

  @override
  void display() {
    print('Displaying booking options for $platform');
  }
}

class MobilePaymentMethod extends PaymentMethod {
  MobilePaymentMethod() : super("Mobile");

  @override
  void process() {
    print('Processing payment for $platform');
  }
}

class MobileUserInterface extends UserInterface {
  MobileUserInterface() : super("Mobile");

  @override
  void render() {
    print('Rendering UI for $platform');
  }
}

abstract class CinemaGuiAbstractFactory {
  BookingOptions getBookingOptions();
  PaymentMethod getPaymentMethod();
  UserInterface getUserInterface();
}

class WebGuiFactory extends CinemaGuiAbstractFactory {
  @override
  BookingOptions getBookingOptions() {
    return WebBookingOptions();
  }

  @override
  PaymentMethod getPaymentMethod() {
    return WebPaymentMethod();
  }

  @override
  UserInterface getUserInterface() {
    return WebUserInterface();
  }
}

class MobileGuiFactory extends CinemaGuiAbstractFactory {
  @override
  BookingOptions getBookingOptions() {
    return MobileBookingOptions();
  }

  @override
  PaymentMethod getPaymentMethod() {
    return MobilePaymentMethod();
  }

  @override
  UserInterface getUserInterface() {
    return MobileUserInterface();
  }
}

class CinemaApplication {
  final CinemaGuiAbstractFactory guiFactory;
  CinemaApplication(this.guiFactory);

  void createCinemaGui() {
    var bookingOptions = guiFactory.getBookingOptions()..display();
    var paymentMethod = guiFactory.getPaymentMethod()..process();
    var userInterface = guiFactory.getUserInterface()..render();
  }
}

class CinemaGuiFactory {
  static CinemaGuiAbstractFactory factory(PlatformType platformType) {
    switch (platformType) {
      case PlatformType.Web:
        return WebGuiFactory();
      case PlatformType.Mobile:
        return MobileGuiFactory();
      default:
        throw ArgumentError('Unknown platform type');
    }
  }
}

void main(List<String> arguments) {
  var platformType = PlatformType.Mobile;
  var guiFactory = CinemaGuiFactory.factory(platformType);
  var app = CinemaApplication(guiFactory);
  app.createCinemaGui();
}
