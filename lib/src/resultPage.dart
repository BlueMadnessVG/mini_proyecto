import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/mainPage.dart';

class ResultPage extends StatelessWidget {
  final Data data;
  const ResultPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[200],
          title: Text('Results'),
          centerTitle: true),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('${data.path}'),
          Text('Result: ${data.result.toStringAsFixed(2)}'),
          Text('Advise: ${data.advise}')
        ],
      )),
    );
  }
}
