import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/bmi_result.dart';
import 'package:flutter_application_1/result_sceen.dart';

import 'constant.dart';
enum Gender{
  male,
  female,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height =170.0;
  int age =20;
  int weight =60;
  var heightvar = 200.0;
  var ageHeight = 220.0;
  Color activeColor = tabcolour;
  Color inactiveColor = backgroundColour;
  Color maleTabColor = backgroundColour;
  Color femaleTabColor = tabcolour;

  Color selectedColour = Colors.grey;
  Color notSelectedColour = Colors.grey;
  Color maleTextColour = Colors.black;
  Color femaleTextColour = Colors.black;

  updateUI(Gender gender){
    if (gender==Gender.male){
      setState(() {
        maleTabColor=activeColor;
        femaleTabColor=inactiveColor;
        maleTextColour=selectedColour;
        femaleTextColour=notSelectedColour;
      });
    }else {
      setState(() {
        femaleTabColor=activeColor;
        maleTabColor=inactiveColor;
        maleTextColour=notSelectedColour;
        femaleTextColour=notSelectedColour;
      });
    }
  }
  

  addSubtractwWeight(bool add){
    add ? weight++ : weight--; 
  }

  addSubtractAge(bool add){
    add ? age++ : age--;
  }

 
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:Center(child: Text("BMI CALCULATOR")),
        backgroundColor: Colors.black,
      ),
      body:Column(
       children: [
        Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(left:8.0, right: 8, top: 8,bottom: 8),
             child: InkWell(
              onTap:(){
               updateUI(Gender.male);
              },
               child: Container(
                decoration: BoxDecoration(
                  color:  maleTabColor
                ),
                 height: heightvar,width: width / 2 - 16,
                 //color: Color.fromARGB(255, 252, 230, 32),
                 child: Column(
                   mainAxisAlignment:MainAxisAlignment.center ,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Icon(Icons.male,
                     size: 60,
                     color:maleTextColour,
                     ),
                     Text("Male",
                     style: TextStyle(
                       fontSize: 40,
                       fontWeight: FontWeight.w500,
                       color: maleTextColour
                     ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         
           Padding(
             padding: const EdgeInsets.only(left:8.0, right: 8, top: 8,bottom: 8),
             child: InkWell(
               onTap: (){
                updateUI(Gender.female);
               },
               child: Container(
                decoration: BoxDecoration(
                  color: femaleTabColor
                ),
                 height: heightvar,width: width / 2 - 16,
                 //color: Color.fromARGB(255, 252, 230, 32),
                 child: Column(
                   mainAxisAlignment:MainAxisAlignment.center ,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Icon(Icons.female,
                     size: 60,
                     color: femaleTextColour,
                     ),
                     Text("Female",
                     style: TextStyle(
                       fontSize: 40,
                       fontWeight: FontWeight.w500,
                       color: femaleTextColour
                     ),),
                   ],
                 ),
               ),
             ),
           )
         ],
        ),
       Padding(
         padding: const EdgeInsets.only(left:8.0,right: 8),
         child: Container(
          height: 225,width: width,
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("HEIGHT",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              ),
              Text(height.round().toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700
              ),
              ),
              SliderTheme(data: SliderTheme.of(context).copyWith(
                thumbColor: Colors.grey,
                activeTrackColor: Color.fromARGB(255, 218, 45, 103),
                inactiveTrackColor: Color.fromARGB(255, 241, 151, 181),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                overlayColor: Colors.pink
              ), child:  Slider(value: height, 
              max: 250,
              min: 140,
              onChanged: (value){
                setState(() {
                  height = value;
                });
              })
              )
            ],
          ),
         ),
       ),
       Row(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
             height: ageHeight,width: width / 2 - 16,
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("WEIGHT",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
                ),
                Text("$weight",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     GestureDetector(onTap: 
                     (){
                      setState(() {
                        addSubtractwWeight(false);
                      });
                     },
                       child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                         child: Icon(Icons.remove,
                         size: 40,
                         ),
                       ),
                     ),
                    GestureDetector(onTap: ()
                    {
                      setState(() {
                        addSubtractwWeight(true);
                      });
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.add,
                        size: 40,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
       
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
            height: ageHeight,width: width/2-16,
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("AGE",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
                ),
                Text("${age}",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        
                         setState(() {
                          addSubtractAge(false);
                       
                          // addSubtractAge(false);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.remove,
                        size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                       onTap: (){
                        setState(() {
                          addSubtractAge(true);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.add,
                        size: 40,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
                 ),
         )
       ],),
       Spacer(),
       GestureDetector(
        onTap: (){
        var heightinmtr = height/100;
        var bmiresult = weight/(heightinmtr*heightinmtr);
        print(bmiresult);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(result: bmiresult,)));
        },
         child: Container(
          color: Colors.yellow,
          height: 50,
          width: width,
          child: Center(child: Text("Calculate Your BMI",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
            
          ),
          )),
          
         ),
       )
       ],
      ),
    );
  }
}