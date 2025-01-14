import 'package:flutter/material.dart';
import 'package:semantic_demo/semantics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MySemantics(),
    );
  }
}
