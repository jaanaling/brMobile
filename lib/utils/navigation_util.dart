import 'package:br_mobile/index.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/binary_converter_page':
        return MaterialPageRoute(
          builder: (context) => const BinaryConverterPage(),
        );
      case '/count_words_page':
        return MaterialPageRoute(builder: (context) => const CountWordsPage());
      case '/euclids_page':
        return MaterialPageRoute(builder: (context) => const EuclidsPage());
      case '/number_in_string_page':
        return MaterialPageRoute(
          builder: (context) => const NumberInStringPage(),
        );
      case '/point_page':
        return MaterialPageRoute(builder: (context) => const PontPage());
      case '/riemann_page':
        return MaterialPageRoute(builder: (context) => const RiemannPage());
      case '/root_extension_page':
        return MaterialPageRoute(
          builder: (context) => const RootExtensionPage(),
        );
      case '/unique_digits_page':
        return MaterialPageRoute(
          builder: (context) => const UniqueDigitsPage(),
        );
      case '/users_page':
        return MaterialPageRoute(builder: (context) => const UserPage());

      default:
        return error();
    }
  }

  static MaterialPageRoute<dynamic> error() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Text('Error'),
        );
      },
    );
  }
}
