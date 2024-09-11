abstract class TicketPricingStrategy {
  double calculatePrice(double basePrice, int quantity);
}

class RegularTicketStrategy implements TicketPricingStrategy {
  @override
  double calculatePrice(double basePrice, int quantity) {
    return basePrice * quantity;
  }
}

class StudentDiscountStrategy implements TicketPricingStrategy {
  @override
  double calculatePrice(double basePrice, int quantity) {
    return basePrice * 0.8 * quantity; // 20% знижка для студентів
  }
}

class FamilyDiscountStrategy implements TicketPricingStrategy {
  @override
  double calculatePrice(double basePrice, int quantity) {
    return basePrice * 0.75 * quantity; // 25% знижка для сімейного квитка
  }
}

class TicketContext {
  late TicketPricingStrategy _pricingStrategy;
  get strategy => this._pricingStrategy;

  void setPricingStrategy(TicketPricingStrategy strategy) {
    this._pricingStrategy = strategy;
  }

  double executePricingStrategy(double basePrice, int quantity) {
    return strategy.calculatePrice(basePrice, quantity);
  }
}

void main() {
  TicketContext context = TicketContext();

  context.setPricingStrategy(RegularTicketStrategy());
  print(
      "Ціна за звичайні квитки: ${context.executePricingStrategy(10.0, 5)}"); // Вихід: 50.0

  context.setPricingStrategy(StudentDiscountStrategy());
  print(
      "Ціна за студентські квитки: ${context.executePricingStrategy(10.0, 5)}"); // Вихід: 40.0

  context.setPricingStrategy(FamilyDiscountStrategy());
  print(
      "Ціна за сімейні квитки: ${context.executePricingStrategy(10.0, 5)}"); // Вихід: 37.5
}
