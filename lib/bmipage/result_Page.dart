import 'package:bmipro/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  String getStatus(){
    String status = '';

    if(bmi < 16.0){
      status = underweightSevere;
    }else if(bmi >= 16.0 && bmi <= 16.9){
      status = underweightModerate;
    }else if(bmi >= 17.0 && bmi <= 18.4){
      status = underweightMild;
    }else if(bmi >= 18.5 && bmi <= 24.9){
      status = normal;
    }else if (bmi >= 25.0 && bmi <= 29.9){
      status = overweightPreObese;
    }else if(bmi >= 30.0 && bmi <= 34.9){
      status = obeseClass1;
    }else if(bmi >= 35.0 && bmi <= 39.9){
      status = obeseClass2;
    }else {
      status = obeseClass3;
    }

    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text("Your BMI is ",style: TextStyle(fontSize: 24,),),
              Text(bmi.toStringAsFixed(2),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const Text("You are  ",style: TextStyle(fontSize: 24,),),
              Text(getStatus(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              const Text("BMI basic categories",style: TextStyle(fontSize: 24,),),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: bmiMap.keys.map((e) {
                    bool firstRow = e == category;
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, style: BorderStyle.solid
                        ),
                      ),
                      child: ListTile(
                        tileColor: e == getStatus() ? Colors.blue : Colors.blueGrey,
                        title: Text(e,style: TextStyle(fontWeight: firstRow ? FontWeight.bold : null,),),
                        trailing: Text(bmiMap[e]!,style: TextStyle(fontWeight: firstRow ? FontWeight.bold : null),),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
