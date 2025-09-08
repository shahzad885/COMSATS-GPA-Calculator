import 'package:flutter/material.dart';
import 'package:gpa/Providers/sgpa_provider.dart';
import 'package:gpa/Screens/About_page.dart';
import 'package:gpa/Screens/Splash_Screen.dart';
import 'package:gpa/Screens/cgpa_calculator.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SGPAProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E3C72),
            foregroundColor: Colors.white,
            centerTitle: true,
            toolbarTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(), // Set the splash screen as home
        routes: {
          '/cgpa': (context) => const CGPACalculatorScreen(),
          '/about': (context) => const AboutPage(), // Add route for About page
        },
      ),
    );
  }
}
