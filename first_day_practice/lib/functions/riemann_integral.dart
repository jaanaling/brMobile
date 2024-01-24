class RiemannIntegral {
  static double integrate(
    double Function(double) f,
    double x1,
    double x2,
    double precision,
  ) {
    if (x1 > x2) {
      throw ArgumentError('Правая точка не может быть больше левой');
    }

    final int n = ((x2 - x1) / precision).ceil();
    final double deltaX = (x2 - x1) / n;

    double result = 0.0;

    for (int i = 0; i < n; i++) {
      final double x = x1 + i * deltaX;
      final double rectangleArea = f(x) * deltaX;
      result += rectangleArea;
    }

    return result;
  }
}
