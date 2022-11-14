import 'package:flutter/material.dart';
import 'package:tugas1_bmi/constants/constant.dart';
import 'package:tugas1_bmi/views/bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {

  int tinggi = 163;
  int berat = 53;
  int umur = 27;
  String? gender; 

  double calculateBmi(){

    double tinggiDalamMeter = tinggi/100;
    final tinggiK = tinggiDalamMeter*tinggiDalamMeter;
    final bmi = berat / tinggiK;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("BMI Kalkulator Jowo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      gender = "male";
                      setState(() {
                        
                      });
                    },
                    child: BmiCard(
                      borderColor: (
                        gender=="male") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.male,
                        title: 'Lanang',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      gender = "female";
                      setState(() {
                        
                      });
                    },
                    child: BmiCard(
                      borderColor: (
                        gender=="female") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.female, 
                        title: 'Wadon',
                      ),
                    ),
                  ),
                ),
              ],
            )),
          Expanded(child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                "DUKUR",
                style: labelTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ), 
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$tinggi",
                    style: numberTextStyle,
                  ),
                  Text(
                    "cm",
                    style: labelTextStyle,
                  ),
                ],
              ),
              Slider(
                value: tinggi.toDouble(), 
                min: 80,
                max: 200,
                thumbColor: const Color(0xFF1BDAD0),
                activeColor: Colors.white,
                onChanged: (value){
                  tinggi = value.toInt();
                  setState(() {
                    
                  });
                },
                )
              ],)
            )),
          Expanded(
            child: Row(
              children: [
                Expanded(child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      "Bobot",
                      style: labelTextStyle,
                    ),
                    Text("$berat", style: numberTextStyle,),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                       [RawMaterialButton(
                        onPressed:(){
                          berat += 1;
                          setState(() {});
                        }, 
                        elevation: 0,
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF5A8DAF),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                       ),
                       const SizedBox(
                        width: 10,
                       ),
                       RawMaterialButton(
                        onPressed:(){
                           berat -= 1;
                          setState(() {});
                        }, 
                        elevation: 0,
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF5A8DAF),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                       ),
                      ],
                    )
                  ]),
                )
                ),
                Expanded(
                  child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      "Umur",
                      style: labelTextStyle,
                    ),
                    Text("$umur", style: numberTextStyle,),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                       [RawMaterialButton(
                        onPressed:(){
                          umur += 1;
                          setState(() {
                            
                          });
                        }, 
                        elevation: 0,
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF5A8DAF),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                       ),
                       const SizedBox(
                        width: 10,
                       ),
                       RawMaterialButton(
                        onPressed:(){
                          umur -= 1;
                          setState(() {
                            
                          });
                        }, 
                        elevation: 0,
                        shape: const CircleBorder(),
                        fillColor: const Color(0xFF5A8DAF),
                        constraints: const BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                       ),
                      ],
                    )
                  ]),
                )
                ),
              ],
            )),
          GestureDetector(
            onTap: (){
              calculateBmi();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return BmiResultScreen(
                    bmi: calculateBmi(),
                  );
                }),
              );
            },
            child: Container(
              height: 80,
              color: const Color(0xFF0E3E5F),
              child: const Center(child: 
                Text("Itung BMI",
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, 
    this.child, 
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF326588),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!
        )
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, required this.title, required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(0xfff8f7f2),
          size: 80,
        ),
        const SizedBox(height: 15,),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}