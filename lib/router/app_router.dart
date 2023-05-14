import 'package:go_router/go_router.dart';

import '../presentation/pages/home_page/home_page.dart';
import '../presentation/pages/info_page/info_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: HomePage.routeName,
        path: '/',
        builder: (context, state) => const HomePage(title: 'App title'),
        routes: [
          GoRoute(
            name: InfoPage.routeName,
            path: 'info',
            builder: (context, state) => const InfoPage(),
          ),
        ],
      ),
    ],
  );
}
