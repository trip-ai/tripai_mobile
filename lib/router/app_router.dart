import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../domain/cubit/weather_cubit/weather_cubit.dart';
import '../presentation/pages/home_page/home_page.dart';
import '../presentation/pages/info_page/info_page.dart';
import '../presentation/pages/interests_page/interests_page.dart';
import '../presentation/pages/intro_page/intro_page.dart';
import '../presentation/pages/loading_page/loading_page.dart';
import '../presentation/pages/location_page/location_page.dart';
import '../presentation/pages/login_page/login_page.dart';
import '../presentation/pages/place_page/place_page.dart';
import '../presentation/pages/splash_page/splash_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: IntroPage.routeName,
        path: '/intro',
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: '/login',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<SignUpCubit>(
              create: (_) => SignUpCubit(),
            ),
          ],
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: HomePage.routeName,
        path: '/home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<WeatherCubit>(
              create: (_) => WeatherCubit(),
            ),
          ],
          child: const HomePage(),
        ),
        routes: [
          GoRoute(
            name: InfoPage.routeName,
            path: 'info',
            builder: (context, state) => const InfoPage(),
          ),
          GoRoute(
            name: LocationPage.routeName,
            path: 'location',
            builder: (context, state) => const LocationPage(),
          ),
          GoRoute(
            name: LoadingPage.routeName,
            path: 'loading',
            builder: (context, state) => const LoadingPage(),
          ),
          GoRoute(
            name: InterestPage.routeName,
            path: 'interests',
            builder: (context, state) => const InterestPage(),
          ),
          GoRoute(
            name: PlacePage.routeName,
            path: 'place',
            builder: (context, state) => const PlacePage(),
          ),
        ],
      ),
    ],
  );
}
