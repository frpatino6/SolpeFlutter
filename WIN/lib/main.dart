import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:solpe_win/helpers/hexColor.dart';
import 'package:solpe_win/routes/routes.dart';

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
                textTheme:
                    Theme.of(context).textTheme.apply(bodyColor: Colors.white),
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 26,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                buttonColor: Colors.white,
                primaryColor: Colors.deepOrange,
                primarySwatch: Colors.blueGrey,
                scaffoldBackgroundColor: HexColor("37474f"),
                cardColor: Colors.blueGrey[50],
                bottomAppBarColor: Color.fromRGBO(255, 213, 40, 1),
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
