import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:rs232_tester/controller/serial.dart';

class Rs232WriterScreen extends StatefulWidget {
  const Rs232WriterScreen({super.key});

  @override
  State<Rs232WriterScreen> createState() => _Rs232WriterScreenState();
}

class _Rs232WriterScreenState extends State<Rs232WriterScreen> {
  // final port = SerialPort('/dev/ttyHSL3'); // use with a tablet
  final port = SerialPort('COM8'); // use with com0com
  TextEditingController textController = TextEditingController();
  SerialController serialController = SerialController();
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer(const Duration(milliseconds: 500), () {
      serialController.initPort();
    });
  }

  @override
  void deactivate() {
    serialController.port.close();
    serialController.port.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Text('Send a Message:'),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: textController,
                ),
              ),
              TextButton(
                  onPressed: () {
                    serialController.write(textController.text);
                    textController.clear();
                  },
                  child: const Text('Send'))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'Receive Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'Receive Messages'),
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'Receive Messages'),
          ],
        ));
  }
}
