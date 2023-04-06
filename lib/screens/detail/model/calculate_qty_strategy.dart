class CalculateQtyStrategy {
  CalculateQtyStrategy._();

  factory CalculateQtyStrategy.minus() = Minus;
  factory CalculateQtyStrategy.plus() = Plus;
}

class Plus extends CalculateQtyStrategy {
  Plus() : super._();
}

class Minus extends CalculateQtyStrategy {
  Minus() : super._();
}
