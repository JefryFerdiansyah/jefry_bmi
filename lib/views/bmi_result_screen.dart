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
  // final BmiCalculator? bmiCalculator;

  // String determineBmiCategory(double bmiValue){
  //   String category = "";
  //   if (bmiValue < 16.0){
  //     category = underweightSevere;
  //   }else if(bmiValue < 17.0){
  //     category = underweightModerate;
  //   }else if(bmiValue < 18.5){
  //     category = underweightMild;
  //   }else if(bmiValue < 25){
  //     category = normal;
  //   }else if(bmiValue < 30){
  //     category = overweight;
  //   }else if(bmiValue < 35){
  //     category = obeseI;
  //   }else if(bmiValue < 40){
  //     category = obeseII;
  //   }else if(bmiValue >= 40){
  //     category = obeseIII;
  //   }
  //   return category;
  // }

  // String getHealRiskDescription(String categoryName){
  //   String desc = "";
  //   switch(categoryName){
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis.";
  //       break;
  //     case normal:
  //       desc = "Low risk (healthy range).";
  //       break;
  //     case overweight:
  //       desc = "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
  //       break;
      
  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    // final bmiCategory = 
    bmiCalculator.determineBmiCategory();
    // final bmiDesc = 
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
              height: 80,
              color: const Color(0xFF517df6),
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