import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo2/ui/app_config_provider.dart';
import 'package:todo2/ui/homescreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppConfigProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Todo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: provider.isDark() ? MyThemeData.darkTheme : MyThemeData.lightTheme,
      themeMode: provider.appTheme,
      routes: {
        HomeScreen.routName: (buildContext) => HomeScreen(),
      },
      initialRoute: HomeScreen.routName,
    );
  }
}

class MyThemeData {
  static const Color lightScaffoldBackground =
      Color.fromARGB(255, 223, 236, 219);
  static const Color darkScaffoldBackground = Color.fromARGB(255, 6, 14, 30);

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: lightScaffoldBackground,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          color: Colors.black45,
        ),
        headline2: TextStyle(
          fontSize: 28,
          color: Colors.black45,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
        ),
        headline4: TextStyle(
          color: Colors.blue,
          fontSize: 12,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        subtitle2: TextStyle(
          fontSize: 16,
          color: Colors.black,
        )),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: darkScaffoldBackground,
    primaryColor: MyThemeData.darkScaffoldBackground,
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 32,
          color: Colors.white54,
        ),
        headline2: TextStyle(
          fontSize: 28,
          color: Colors.white54,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 14,
        ),
        headline4: TextStyle(
          color: Colors.blue,
          fontSize: 12,
        ),
        subtitle1: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        subtitle2: TextStyle(
          fontSize: 16,
          color: Colors.white,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyThemeData.darkScaffoldBackground,
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        )),
  );
}
