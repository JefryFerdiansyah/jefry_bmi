import 'package:tugas1_bmi/constants/constant.dart';

class BmiCalculator{
  int? tinggi;
  int? berat;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.tinggi, required this.berat});
  BmiCalculator.fromBmiValue(this.bmi);

  double calculateBmi(){

    double tinggiDalamMeter = tinggi! / 100;
    final tinggiK = (tinggiDalamMeter * tinggiDalamMeter);
    bmi = berat! / tinggiK;

    return bmi!;
  }
  String determineBmiCategory(){
    String category = "";
    if (bmi! < 16.0){
      category = underweightSevere;
    }else if(bmi! < 17.0){
      category = underweightModerate;
    }else if(bmi! < 18.5){
      category = underweightMild;
    }else if(bmi! < 25){
      category = normal;
    }else if(bmi! < 30){
      category = overweight;
    }else if(bmi! < 35){
      category = obeseI;
    }else if(bmi! < 40){
      category = obeseII;
    }else if(bmi! >= 40){
      category = obeseIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription(){
    String desc = "";
    switch(bmiCategory){
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc = "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      
      default:
    }
    bmiDescription = desc;
    return desc;
  }
}