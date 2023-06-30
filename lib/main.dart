import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/const_colors.dart';
import 'generated/l10n.dart';
import 'router/app_router.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tripai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ConstColors.scaffoldBackgroundColor,
        fontFamily: 'SFUIDisplay',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: AppRouter.router,
    );
  }
}
