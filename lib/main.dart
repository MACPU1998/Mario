import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
 // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mario',
       home: const MyHomePage(title: 'Marioo'),
    );
  }
}
