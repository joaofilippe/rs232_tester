import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rs232_tester/controller/serial.dart';

class SerialReaderWriter extends StatefulWidget {
  const SerialReaderWriter({super.key});

  @override
  State<SerialReaderWriter> createState() => _SerialReaderWriterState();
}

class _SerialReaderWriterState extends State<SerialReaderWriter> {
  SerialController serialController = SerialController();
  TextEditingController textController = TextEditingController();
  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(milliseconds: 500), () {
      serialController.initPort();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Serial Reader and Writer DEMO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text("Writer"),
                      Container(
                          margin: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                          child: const TextField())
                    ],
                  )),
              const Text("Reader")
            ],
          ),
        ));
  }
}
