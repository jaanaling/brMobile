extension RootExtension on num {
  num root(int degree) {
    if (this < 0 && degree.isEven) {
      throw ArgumentError(
        'Невозможно извлечь корень четной степени из отрицательного числа',
      );
    }

    if (degree == 0) {
      throw ArgumentError('Степень не может быть равна 0');
    }

    if (this == 0 && degree < 0) {
      throw ArgumentError(
        'Невозможно извлечь корень отрицательной степени из 0',
      );
    }

    final double x0 = toDouble();
    double x1 = x0;

    for (int i = 0; i < 100; i++) {
      x1 = ((degree - 1) * x1 + this / (x1.powerRecursive(x1, degree - 1))) /
          degree;
    }

    return x1;
  }

  double powerRecursive(double base, double power) {
    if (power == 0) {
      return 1;
    }

    if (power > 0) {
      return base * powerRecursive(base, power - 1);
    } else {
      return 1.0 / (base * powerRecursive(base, -power - 1));
    }
  }
}
