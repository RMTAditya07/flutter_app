import 'package:flutter/material.dart';
import 'package:mira2/pages/HomePage.dart';
import 'package:mira2/pages/Step4Page.dart';

void main() {
  runApp(const Mira2());
}

class Mira2 extends StatelessWidget {
  const Mira2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
