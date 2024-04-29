import 'package:flutter/material.dart';
import 'package:rs232_tester/controller/serial.dart';

class SerialReaderScreen extends StatefulWidget {
  const SerialReaderScreen({super.key});

  @override
  State<SerialReaderScreen> createState() => _SerialReaderScreenState();
}

class _SerialReaderScreenState extends State<SerialReaderScreen> {
  SerialController controller = SerialController();
  List<String> received = [];

  @override
  void initState() {
    super.initState();

    // timer = Timer(const Duration(milliseconds: 500), () {
    controller.initPort();
    controller.startListen();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serial App Demo"),
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, child) => ListView.builder(
          itemCount: controller.dataStr.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(
                controller.dataStr[controller.dataStr.length - i - 1],
                style: const TextStyle(fontSize: 16),
              ),
              leading: Text(
                (controller.dataStr.length - i).toString(),
                style: const TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.clearList(),
        child: const Icon(Icons.cleaning_services),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
