import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_sun_3/auth/login/login_screen.dart';
import 'package:flutter_app_todo_sun_3/auth/register/register_screen.dart';
import 'package:flutter_app_todo_sun_3/home/home_screen.dart';
import 'package:flutter_app_todo_sun_3/my_theme.dart';
import 'package:flutter_app_todo_sun_3/providers/auth_provider.dart';
import 'package:flutter_app_todo_sun_3/providers/list_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: 'YOUR_FIREBASE_APP_ID',
      messagingSenderId: 'YOUR_SENDER_ID',
      apiKey: 'YOUR_FIREBASE_API_KEY',
      projectId: 'YOUR_FIREBASE_PROJECT_ID',
      databaseURL: 'YOUR_FIREBASE_DATABASE_URL',
      storageBucket: 'YOUR_FIREBASE_STORAGE_BUCKET',
    ),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ListProvider()),
      ChangeNotifierProvider(create: (context) => MyAuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
