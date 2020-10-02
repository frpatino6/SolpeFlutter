import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:rcn_solpe/routes/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        return brightness == Brightness.light
            ? ThemeData(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.white,
          cardColor: Colors.blueGrey[50],
          primaryTextTheme: TextTheme(
            button: TextStyle(
              color: Colors.blueGrey,
              decorationColor: Colors.blueGrey[300],
            ),
            subtitle2: TextStyle(
              color: Colors.blueGrey[900],
            ),
            subtitle1: TextStyle(
              color: Colors.black,
            ),
            headline1: TextStyle(color: Colors.blueGrey[800]),
          ),
          bottomAppBarColor: Color.fromRGBO(255, 213, 40, 1),
          iconTheme: IconThemeData(color: Colors.blueGrey),
          brightness: brightness,
        )
            : ThemeData(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.blueGrey[900],
          cardColor: Colors.black,
          primaryTextTheme: TextTheme(
            button: TextStyle(
              color: Colors.blueGrey[200],
              decorationColor: Colors.blueGrey[50],
            ),
            subtitle2: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.blueGrey[300],
            ),
            headline1: TextStyle(
              color: Colors.white70,
            ),
          ),
          bottomAppBarColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.blueGrey[200]),
          brightness: brightness,
        );
      },
      themedWidgetBuilder: (context, data) => MaterialApp(
        title: '',
        theme: data,
        initialRoute: '/',
        routes: getApplicationsRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

