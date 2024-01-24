class EuclidsAlgoritms {
  static int findGCD(int a, int b) {
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  static int findLCM(int a, int b) {
    if (a == 0) {
      throw ArgumentError('Невозможно делить на 0');
    }
    return (a * b) ~/ findGCD(a, b);
  }

  static List<int> primeFactors(int n) {
    final List<int> factors = [];

    for (int i = 2; i <= n; i++) {
      while (n % i == 0) {
        factors.add(i);
        n = n ~/ i;
      }
    }

    return factors;
  }
}
