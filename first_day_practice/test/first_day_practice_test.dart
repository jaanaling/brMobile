import 'package:flutter_test/flutter_test.dart';

import 'package:first_day_practice/index.dart';

void main() {
  group('First day', () {
    group('euclids_algorithm', () {
      test('НОД целых чисел', () {
        expect(EuclidsAlgoritms.findGCD(12, 40), 4);
        expect(EuclidsAlgoritms.findGCD(12, 36), 12);
        expect(EuclidsAlgoritms.findGCD(12, 34), 2);
      });
      test('НОК целых чисел', () {
        expect(EuclidsAlgoritms.findLCM(12, 40), 120);
        expect(EuclidsAlgoritms.findLCM(12, 36), 36);
        expect(EuclidsAlgoritms.findLCM(12, 34), 204);
      });
      test('Простые множители числа', () {
        expect(EuclidsAlgoritms.primeFactors(12), [2, 2, 3]);
        expect(EuclidsAlgoritms.primeFactors(34), [2, 17]);
        expect(EuclidsAlgoritms.primeFactors(36), [2, 2, 3, 3]);
      });
    });

    group('binary_converter', () {
      test('Десятичное число в двоичной системе', () {
        expect(BinaryConverter.decimalToBinary(27), '11011');
        expect(BinaryConverter.decimalToBinary(13), '1101');
        expect(BinaryConverter.decimalToBinary(48), '110000');
      });
      test('Двоичное число в десятичной системе', () {
        expect(BinaryConverter.binaryToDecimal('11011'), 27);
        expect(BinaryConverter.binaryToDecimal('1101'), 13);
        expect(BinaryConverter.binaryToDecimal('110000'), 48);
      });
    });

    group('NumberInString', () {
      test('Числа в строке', () {
        expect(
          NumberInString.findNumbersInString(
            'There are 3 numbers in this string: 1.5 2 3.14',
          ),
          [3, 1.5, 2, 3.14],
        );
        expect(
          NumberInString.findNumbersInString(
            'There are 5 numbers in this string: 1.5 2 3.14 555',
          ),
          [5, 1.5, 2, 3.14, 555],
        );
      });
    });
    group('ExtractUniqueDigits', () {
      test('Числа в строке', () {
        expect(
          ExtractUniqueDigits.extractUniqueDigits('one, two, zero, zero'),
          [1, 2, 0],
        );
        expect(
          ExtractUniqueDigits.extractUniqueDigits(
            'one, two, zero, zero, five, nonono',
          ),
          [1, 2, 0, 5],
        );
      });
    });

    group('CountWordInList', () {
      test('Слова и их количество в коллекции', () {
        expect(
          CountWordInList.countWords([
            'apple',
            'banana',
            'orange',
            'apple',
            'grape',
            'banana',
            'apple',
            'orange',
            'orange',
          ]),
          {'apple': 3, 'banana': 2, 'orange': 3, 'grape': 1},
        );
        expect(
          CountWordInList.countWords([
            'apple',
            'banana',
            'orange',
            'apple',
            'grape',
            'grape',
            'grape',
            'banana',
            'apple',
            'orange',
            'orange',
          ]),
          {'apple': 3, 'banana': 2, 'orange': 3, 'grape': 3},
        );
      });
    });

    group('Point', () {
      test('Сравнение', () {
        expect(Point(1, 2, 3) == Point(1, 2, 3), isTrue);
        expect(Point(1, 2, 3) == Point(4, 5, 6), isFalse);
      });

      test('Растояние', () {
        expect(
          Point(1, 2, 3).distanceTo(Point(4, 5, 6)),
          closeTo(5.196, 0.001),
        );
      });

      test('Создание', () {
        expect(Point.origin(), equals(Point(0, 0, 0)));
        expect(Point.unit(), equals(Point(1, 1, 1)));
        expect(
          Point.triangle(Point(0, 0, 0), Point(1, 0, 0), Point(0, 1, 0)),
          equals(Point(0.5, 0.5, 0.5)),
        );
      });
    });

    group('Root calculation', () {
      test('Вычисление корня', () {
        expect(8.root(3), equals(2.0));
      });

      test('Вычисление корня из негативного числа', () {
        expect(() => (-8).root(2), throwsA(const TypeMatcher<ArgumentError>()));
      });
    });

    group('UserManager', () {
      test('Добавить и отобразить пользователей', () {
        final UserManager<User> userManager = UserManager<User>();
        userManager.addUser(AdminUser('admin@example.com'));
        userManager.addUser(GeneralUser('user@mail.ru'));

        expect(
          userManager.printEmails(),
          equals(['example.com', 'user@mail.ru']),
        );

        userManager.removeUser(userManager.users[1]);

        expect(userManager.printEmails(), equals(['example.com']));
      });
    });

    group('Riemann Integral tests', () {
      test('Расчёт интегралла', () {
        expect(
          RiemannIntegral.integrate((x) => x * x, 0.0, 1.0, 0.001),
          closeTo(0.333, 0.001),
        );
      });

      test('Расчёт инегралла с неверными точками', () {
        expect(
          () => RiemannIntegral.integrate((x) => x, 2.0, 1.0, 0.001),
          throwsA(const TypeMatcher<ArgumentError>()),
        );
      });
    });
  });
}
