import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rs232_tester/controller/serial.dart';

class Reader extends StatefulWidget {
  final SerialController serialController;
  final Timer timer;
  const Reader(
      {super.key, required this.serialController, required this.timer});

  @override
  State<Reader> createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: ListenableBuilder(
          listenable: widget.serialController,
          builder: ((context, child) => Container(
                margin: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 50),
                        child: const Text(
                          'Reader',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: widget.serialController.dataStr.isEmpty
                                ? 1
                                : widget.serialController.dataStr.length,
                            itemBuilder: (context, i) {
                              var data = widget.serialController.dataStr;
                              if (data.isNotEmpty) {
                                return ListTile(
                                  leading: Text((data.length - i).toString()),
                                  title: Text(data[data.length - i - 1]),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }),
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))),
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary),
                          onPressed: () => widget.serialController.clearList(),
                          child: Text('Clear List',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
