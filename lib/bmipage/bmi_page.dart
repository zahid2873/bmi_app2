import 'package:bmipro/bmipage/result_Page.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double height = 0.0;

  double weight = 0.0;

  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bmi Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 60),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                onChanged: (value) {
                  weight = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your weight (in kg)",
                  labelText: "Weight",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                onChanged: (value) {
                  height = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  //filled: true,
                  //fillColor: Colors.lightBlueAccent,
                  hintText: "Enter your height (in meter)",
                  labelText: "Height",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bmi = weight / (height * height);
                });
                print('Weight: $weight, Height: $height, BMI: $bmi');
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(bmi: bmi,),
                    ));
              },
              child: Text("Calculate"),
            )
          ],
        ),
      ),
    );;
  }
}
