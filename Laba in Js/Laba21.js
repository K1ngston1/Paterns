// Абстрактний клас для стратегії
class TicketPricingStrategy {
  calculatePrice(basePrice, quantity) {
    throw new Error("Цей метод має бути реалізованим!");
  }
}

// Стратегія для звичайного квитка
class RegularTicketStrategy extends TicketPricingStrategy {
  calculatePrice(basePrice, quantity) {
    return basePrice * quantity;
  }
}

// Стратегія для студентського квитка зі знижкою
class StudentDiscountStrategy extends TicketPricingStrategy {
  calculatePrice(basePrice, quantity) {
    return basePrice * 0.8 * quantity; // 20% знижка для студентів
  }
}

// Стратегія для сімейного квитка зі знижкою
class FamilyDiscountStrategy extends TicketPricingStrategy {
  calculatePrice(basePrice, quantity) {
    return basePrice * 0.75 * quantity; // 25% знижка для сімейного квитка
  }
}

// Контекст для обчислення ціни квитка
class TicketContext {
  setPricingStrategy(strategy) {
    this._pricingStrategy = strategy;
  }

  executePricingStrategy(basePrice, quantity) {
    if (!this._pricingStrategy) {
      throw new Error("Стратегія не встановлена!");
    }
    return this._pricingStrategy.calculatePrice(basePrice, quantity);
  }
}

// Використання стратегії
const context = new TicketContext();

// Стратегія для звичайного квитка
context.setPricingStrategy(new RegularTicketStrategy());
console.log(
  `Ціна за звичайні квитки: ${context.executePricingStrategy(10.0, 5)}`
); // Вихід: 50.0

// Стратегія для студентського квитка зі знижкою
context.setPricingStrategy(new StudentDiscountStrategy());
console.log(
  `Ціна за студентські квитки: ${context.executePricingStrategy(10.0, 5)}`
); // Вихід: 40.0

// Стратегія для сімейного квитка зі знижкою
context.setPricingStrategy(new FamilyDiscountStrategy());
console.log(
  `Ціна за сімейні квитки: ${context.executePricingStrategy(10.0, 5)}`
); // Вихід: 37.5
