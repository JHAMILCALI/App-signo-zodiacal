import 'package:app_signo_zodiacal/screens/ayuda_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_signo_zodiacal/screens/fecha_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zodiaco y Horóscopo Chino',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F5FD),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: const FechaScreen(),
      routes: {'/ayuda': (context) => const AyudaScreen()},
    );
  }
}
