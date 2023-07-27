import 'package:flutter/material.dart';
import 'package:iphone_notes_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Iphone Note App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
