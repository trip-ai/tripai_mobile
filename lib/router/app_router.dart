import 'package:go_router/go_router.dart';

import '../presentation/pages/home_page/home_page.dart';
import '../presentation/pages/info_page/info_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(title: 'App title'),
      ),
      GoRoute(
        path: InfoPage.routeName,
        builder: (context, state) => const InfoPage(),
      ),
    ],
  );
}
