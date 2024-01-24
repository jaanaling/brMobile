import 'package:first_day_practice/functions/users_functions/index.dart';

mixin MailSystemMixin on User {
  String getMailSystem() {
    if (email.contains('@')) {
      final List<String> parts = email.split('@');
      return parts.length > 1 ? parts[1] : '';
    } else {
      return '';
    }
  }
}
