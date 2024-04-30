import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rs232_tester/controller/serial.dart';

class Writer extends StatefulWidget {
  final SerialController serialController;
  final Timer timer;
  const Writer(
      {super.key, required this.serialController, required this.timer});

  @override
  State<Writer> createState() => _WriterState();
}

class _WriterState extends State<Writer> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Writer",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: TextField(
                    controller: textController,
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                  alignment: AlignmentDirectional.bottomEnd,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          backgroundColor:
                              Theme.of(context).colorScheme.inversePrimary),
                      onPressed: () {
                        try {
                          widget.serialController.write(textController.text);
                          textController.clear();
                        } catch (e) {
                          log('error ${e.toString()}');
                        }
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )),
                ),
              )
            ],
          )),
    );
    ;
  }
}
