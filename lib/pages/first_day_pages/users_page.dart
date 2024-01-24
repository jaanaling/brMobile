import 'package:br_mobile/index.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController textEditingAddAdminController = TextEditingController();
  TextEditingController textEditingAddGeneralController =
      TextEditingController();
  TextEditingController textEditingDeleteController = TextEditingController();
  final UserManager<User> userManager = UserManager<User>();
  String userList = '';
  String userAddResult = '';
  String userDeleteResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Manager'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title: 'Работа с пользователями',
              ),
              textResult(
                'admin',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingAddAdminController,
                onChanged: (TextEditingController controller) => {},
              ),
              _button('Add admin', _addAdmin),
              textResult(
                'general',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingAddGeneralController,
                onChanged: (TextEditingController controller) => {},
              ),
              _button('Add general', _addGeneral),
              textResult(
                userAddResult,
              ),
              textResult(
                'delete',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingDeleteController,
                onChanged: (TextEditingController controller) => {},
              ),
              textResult(
                userDeleteResult,
              ),
              _button('Delete user', _userDelete),
              textResult(
                userList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _button(String title, Function function) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.40,
        child: ElevatedButton(
          onPressed: () => function(),
          child: Text(title),
        ),
      ),
    );
  }

  void _addAdmin() {
    setState(() {
      try {
        userManager.addUser(AdminUser(textEditingAddAdminController.text));
        userAddResult =
            'Администратор ${textEditingAddAdminController.text} добавлен';
        userList = userManager.printEmails().toString();
      } catch (e) {
        userAddResult = e.toString();
      }
    });
  }

  void _addGeneral() {
    setState(() {
      try {
        userManager.addUser(GeneralUser(textEditingAddGeneralController.text));
        userAddResult =
            'Пользователь ${textEditingAddGeneralController.text} добавлен';
        userList = userManager.printEmails().toString();
        userDeleteResult = '';
      } catch (e) {
        userAddResult = e.toString();
      }
    });
  }

  void _userDelete() {
    setState(() {
      try {
        userManager.removeUser(GeneralUser(textEditingDeleteController.text));
        userDeleteResult =
            'Пользователь ${textEditingDeleteController.text} удалён';
        userList = userManager.printEmails().toString();
        userAddResult = '';
      } catch (e) {
        userAddResult = '';
        userDeleteResult = e.toString();
      }
    });
  }
}
