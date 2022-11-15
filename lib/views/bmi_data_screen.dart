import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas1_bmi/constants/constant.dart';
import 'package:tugas1_bmi/helpers/bmi_calculator.dart';
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

  List<Widget> generateList(start, end){
    List<Widget> weights = [];
    for(var i = start; i < end; i++){
      weights.add(
        Text(
          "$i",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        )
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("BMI Kalkulator"),
      ),
      bottomNavigationBar: GestureDetector(
            onTap: (){
              final bmiCalculator = BmiCalculator(tinggi: tinggi, berat: berat);
              bmiCalculator.calculateBmi();
              
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context){
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              );
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color(0xFF517df6),
              ),
              child: const Center(child: 
                Text("Hitung BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ),
            ),
          ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
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
                        gender=="male") ? const Color(0xff517df6) : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child:  Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0,),
                              child:  GenderIconText(
                                icon: Icons.male,
                                title: 'Laki-Laki',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male") ? const Color(0xff517df6) : Colors.white,
                            ),
                          )
                        ],
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
                        gender=="female") ? const Color(0xff517df6) : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0,),
                              child: GenderIconText(
                                icon: Icons.female, 
                                title: 'Perempuan',
                              ),
                            ),
                          ),
                           Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female") ? const Color(0xff517df6) : Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Column(
              children: [
                Text(
                  "Tinggi Badan",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          value: tinggi.toDouble(), 
                          min: 80,
                          max: 200,
                          thumbColor: const Color(0xFF1BDAD0),
                          activeColor: const Color(0xFF1BDAD0),
                          onChanged: (value){
                            tinggi = value.toInt();
                            setState(() {
                              
                            });
                          },
                          )
                        ),
                    ),
                    
                    BmiCard(
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal : 15.0, 
                        vertical: 15.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$tinggi",
                              style: labelTextStyle,
                            ),
                            Text(
                              " cm",
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                      "Berat Badan",
                      style: labelTextStyle,
                    ),
                      BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                              initialItem: 30),
                            itemExtent: 25, 
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val){
                              berat = val + 20;
                            },
                            children: generateList(20, 220),
                           ),
                        ),
                      ]),
                ),
                    ],
                  )
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                      "Umur",
                      style: labelTextStyle,
                    ),
                    
                      BmiCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                              initialItem: 5),
                            itemExtent: 25, 
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val){
                              berat = val + 20;
                            },
                            children: generateList(15, 90),
                            ),
                        ),
                      ]),
                ),
                    ],
                  )
                ),
              ],
            ),
            
          ]),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, 
    this.child, 
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2,2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.15),
          )
        ],
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
          color: primaryColor,
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