import 'package:clean_todo/core/presentation/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import 'app_localizations.dart';

class App extends StatelessWidget {
  final String title;
  final GoRouter routes;
  const App({
    Key? key,
    required this.title,
    required this.routes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        routerConfig: routes,
        title: title,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('sw', 'KE'),
        ],
      ),
    );
  }
}
