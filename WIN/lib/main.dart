
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:solpe_win/helpers/hexColor.dart';
import 'package:solpe_win/providers/token_provider.dart';
import 'package:solpe_win/routes/routes.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print('User granted permission: ${settings.authorizationStatus}');
}


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  messaging.getToken().then((token) {
    print(token);
    PlatformProvider.instance.token= token!;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solpe WinSports',
      initialRoute: '/',
      routes: getApplicationsRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
    );
  }
}
