import 'package:first_day_practice/functions/users_functions/models/admin_user.dart';
import 'package:first_day_practice/functions/users_functions/models/user.dart';
import 'package:logger/logger.dart';

class UserManager<T extends User> {
  List<T> users = [];
  Logger logger = Logger();

  void addUser(T user) {
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(user.email)) {
      throw ArgumentError('Неверно введёный email');
    }
    users.add(user);
  }

  void removeUser(T user) {
    if (printEmails().contains(user.email)) {
      throw ArgumentError('email не существует');
    }
    users.removeAt(printEmails().indexOf(user.email));
  }

  List<String> printEmails() {
    final List<String> usersList = [];
    for (final T user in users) {
      if (user is AdminUser) {
        logger.d('Admin email system: ${user.getMailSystem()}');
        usersList.add(user.getMailSystem());
      } else {
        logger.d('General user email: ${user.email}');
        usersList.add(user.email);
      }
    }
    return usersList;
  }
}
