import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_proyecto/src/resultPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final data = new Data(result: 0, path: '', advise: '');
  final _ctrlMass = new TextEditingController();
  final _ctrlHeight = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('IMC'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _ctrlMass,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the mass (kg):',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _ctrlHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the height (m)',
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue[200], onPrimary: Colors.white),
              child: Text('Get results'),
              onPressed: () {
                setState(() {
                  data.result = double.parse(_ctrlMass.text) /
                      pow(double.parse(_ctrlHeight.text), 2);

                  if (data.result < 18) {
                    data.path = 'assets/Wilton_loop.gif';
                    data.advise =
                        'It is necessary to assess signs of malnutrition';
                  } else if (data.result >= 18 && data.result <= 24.9) {
                    data.path = 'assets/Wilson_idle_down.jpg';
                    data.advise = 'You\'r fine';
                  } else if (data.result >= 25 && data.result <= 26.9) {
                    data.path = 'assets/Wolfgang.png';
                    data.advise = 'Start not being well';
                  } else if (data.result >= 27 && data.result <= 29.9) {
                    data.path = 'assets/pig.png';
                    data.advise =
                        'Relative risk for developing cardiovascular diseases';
                  } else if (data.result >= 30 && data.result <= 39.9) {
                    data.path = 'assets/Bearger.png';
                    data.advise =
                        'Very high relative risk for the development of cardiovascular diseases';
                  } else {
                    data.path = 'assets/Pig_King.png';
                    data.advise =
                        'Relative risk extremely high for the development of diseases cardiovascular';
                  }

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResultPage(data: data)));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class Data {
  double result;
  String path;
  String advise;

  Data({required this.result, required this.path, required this.advise});
}
