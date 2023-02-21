import 'package:bayasys/pages/landing_screen.dart';
import 'package:bayasys/pages/login.dart';
import 'package:bayasys/provider/main_data_class.dart';
import 'package:bayasys/sqflite/main_db.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainData.initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MainData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff01577b),
          secondaryHeaderColor: Colors.black.withOpacity(0.6)
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
