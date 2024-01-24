import 'package:br_mobile/index.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 70, 69, 69),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          color: Color.fromARGB(255, 53, 52, 52),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 185, 185, 185),
            fontSize: 24,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: RouteGenerator.navigatorKey,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
