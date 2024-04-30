import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rs232_tester/controller/serial.dart';
import 'package:rs232_tester/widget/reader.dart';
import 'package:rs232_tester/widget/writer.dart';

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
      serialController.startListen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serial Reader and Writer DEMO"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Reader(serialController: serialController, timer: timer),
          Writer(serialController: serialController, timer: timer),
        ],
      ),
    );
  }
}
