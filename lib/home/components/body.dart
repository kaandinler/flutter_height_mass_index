import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyBodyWidget extends StatefulWidget {
  const MyBodyWidget({super.key});

  @override
  State<MyBodyWidget> createState() => _MyBodyWidgetState();
}

class _MyBodyWidgetState extends State<MyBodyWidget> {
  double _currentHeightValue = 150;
  double _currentMassValue = 20;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "Height: ${_currentHeightValue.round()} cm",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Slider(
          value: _currentHeightValue,
          label: _currentHeightValue.round().toString(),
          thumbColor: Colors.orange,
          activeColor: Colors.orange,
          inactiveColor: Colors.orange[100],
          onChanged: (double value) {
            setState(() {
              _currentHeightValue = value;
            });
          },
          max: 230,
          min: 45,
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "Mass: ${_currentMassValue.round()} kg",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Slider(
          value: _currentMassValue,
          label: _currentMassValue.round().toString(),
          thumbColor: Colors.orange,
          activeColor: Colors.orange,
          inactiveColor: Colors.orange[100],
          onChanged: (double value) {
            setState(() {
              _currentMassValue = value;
            });
          },
          max: 200,
          min: 20,
        ),
        //button
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              minimumSize: const Size(200, 50)),
          onPressed: () {
            setState(() {
              _bmi = _currentMassValue /
                  ((_currentHeightValue / 100) * (_currentHeightValue / 100));
            });
          },
          child: const Text("Calculate"),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "BMI: ${_bmi.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Text(
            "18.5 - 25: Normal\n25 - 30: Overweight\n30 - 35: Obese\n35 - 40: Severely Obese\n40+: Morbidly Obese",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
