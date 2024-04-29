import 'package:flutter/material.dart';
import 'package:rs232_tester/screens/reader_writer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RS232-Tester',
      theme: ThemeData.dark(),
      home: const SerialReaderWriter(),
    );
  }
}
