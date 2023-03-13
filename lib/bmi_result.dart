import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResultScreen extends StatefulWidget {
  final double result;
  const ResultScreen({super.key, required this.result});
 
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
String text = "Normal";
String tagline = "Stay as it is";
Color color =Colors.white;
String imagename ="Normal";


void updateUI(String textOne ,String tag ,Color colour,String imageName){
  text=textOne;
  tagline=tag;
  color=colour;
  imagename=imageName;
}

getBmiChart(){
  if(widget.result <18){
    updateUI("Underweight", "Eat more, Grow Faster", Colors.blue,'underweight' );
  }
  else if(widget.result >18 && widget.result < 25){
    updateUI("Normal", "Stay as it is", Colors.black,'normal');
  }
  else if(widget.result > 25 && widget.result < 30){
    updateUI("OverWeight", "Eat less Exercise more", Colors.orange,'overweight');
  }
  else if(widget.result > 30 && widget.result < 35){
    updateUI("Obese", "Don't eat Just Excersize", Colors.red,'obese');
  }
  else {
  text = "error";
  }
}
@override 
void initState() {
    // TODO: implement initState
    super.initState();
    getBmiChart();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("BMI RESULT"),
        ),
      ),
      body:Column(
        children: [
          Container(
            height: 300,width: width,
            color: Colors.yellow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                style: TextStyle(
                  color: color,
                  fontSize: 40,
                  fontWeight: FontWeight.w500
                ),
                ),
                Text("${widget.result.round().toString()}",
                style: TextStyle(
                  fontSize: 40,
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
                ),
                Text(tagline,
                style: TextStyle(
                 fontSize: 40,
                 color: color,
                 fontWeight: FontWeight.w500 
                ),
                )
              ],
            ),
          ),
          Image.asset("images/${imagename}.png", height: 350,fit: BoxFit.fitHeight,)
        ],
      ),
   
    );
  }
}