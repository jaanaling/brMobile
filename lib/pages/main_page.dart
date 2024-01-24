import 'package:br_mobile/index.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttonsList = [
      menuButton(
        title: 'Euclids',
        path: '/euclids_page',
        context: context,
      ),
      menuButton(
        title: 'Binary converter',
        path: '/binary_converter_page',
        context: context,
      ),
      menuButton(
        title: 'Count words',
        path: '/count_words_page',
        context: context,
      ),
      menuButton(
        title: 'Point',
        path: '/point_page',
        context: context,
      ),
      menuButton(
        title: 'Riemann',
        path: '/riemann_page',
        context: context,
      ),
      menuButton(
        title: 'Root extension',
        path: '/root_extension_page',
        context: context,
      ),
      menuButton(
        title: 'Unique digits',
        path: '/unique_digits_page',
        context: context,
      ),
      menuButton(
        title: 'User Manager',
        path: '/users_page',
        context: context,
      ),
      menuButton(
        title: 'Number in string',
        path: '/number_in_string_page',
        context: context,
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.separated(
          itemCount: buttonsList.length,
          separatorBuilder: (BuildContext context, int index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: buttonsList[index],
            );
          },
        ),
      ),
    );
  }
}
