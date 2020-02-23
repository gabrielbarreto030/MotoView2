import 'package:flutter/material.dart';
import 'package:motovibe/model/Document.dart';


import 'package:printing/printing.dart';

class BoletoBancario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Printing Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.print),
          tooltip: 'Print Document',
          onPressed: () {
             Printing.layoutPdf(
               onLayout: buildPdf,
             );
          },
        ),
    ));
  }
}
