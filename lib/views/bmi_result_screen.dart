import 'package:flutter/material.dart';
import 'package:tugas1_bmi/helpers/bmi_calculator.dart';
import 'package:tugas1_bmi/views/bmi_data_screen.dart';
import 'package:tugas1_bmi/constants/constant.dart';

class BmiResultScreen extends StatelessWidget {
   const BmiResultScreen({
    Key? key,
    required this.bmi,
  }) : super(key: key);
  final double bmi;
  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil hitung BMI"),
      ),
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Text(
              "Hasil Perhitungan",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ) ,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiCalculator.bmiCategory!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      ),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      ),
                    ),
                  Text(
                    bmiCalculator.bmiDescription!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xFF517df6),
              ),
              child: const Center(child: 
                Text("Hitung Ulang",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ),
            ),
          )
      ]),
    );
  }
}