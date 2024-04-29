import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class SerialController with ChangeNotifier {
  // SerialPort port = SerialPort("/dev/ttyHSL3");
  final port = SerialPort('COM9');
  late SerialPortReader reader;
  late Uint8List data;
  List<String> dataStr = [];
  List<String> availablePorts = [];

  void getPorts() {
    availablePorts = SerialPort.availablePorts;
    notifyListeners();
  }

  void initPort() {
    try {
      port.openReadWrite();
      port.config = SerialPortConfig()
        ..baudRate = 9600
        ..bits = 8
        ..stopBits = 1
        ..parity = SerialPortParity.space
        ..setFlowControl(SerialPortFlowControl.none);
      reader = SerialPortReader(port);
    } catch (e) {
      log(e.toString());
    }
  }

  void startListen() {
    reader.stream.listen((received) {
      data = received;
      dataStr.add(String.fromCharCodes(received));
      notifyListeners();
    }, onError: (error) => log(error.toString()));
  }

  void clearList() {
    dataStr = [];
    notifyListeners();
  }

   write(String message) {
    if (!port.isOpen) return;
    port.write(Uint8List.fromList(message.codeUnits));
  }
}
