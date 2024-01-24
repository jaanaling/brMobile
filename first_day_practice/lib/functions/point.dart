import 'dart:math';

class Point {
  double x;
  double y;
  double z;

  Point(this.x, this.y, this.z);

  factory Point.origin() {
    return Point(0, 0, 0);
  }

  factory Point.unit() {
    return Point(1, 1, 1);
  }

  factory Point.triangle(Point a, Point b, Point c) {
    final double side1 = a.distanceTo(b);
    final double side2 = b.distanceTo(c);
    final double side3 = c.distanceTo(a);

    final double p = (side1 + side2 + side3) / 2;
    final double area = double.parse(
      sqrt(p * (p - side1) * (p - side2) * (p - side3)).toStringAsFixed(1),
    );

    return Point(area, area, area);
  }

  double distanceTo(Point another) {
    final double dx = x - another.x;
    final double dy = y - another.y;
    final double dz = z - another.z;

    return sqrt(pow(dx, 2) + pow(dy, 2) + pow(dz, 2));
  }

  @override
  String toString() {
    return 'Point(x: $x, y: $y, z: $z)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && x == other.x && y == other.y && z == other.z;

  @override
  int get hashCode => x.ceil() + y.ceil() + z.ceil();
}
