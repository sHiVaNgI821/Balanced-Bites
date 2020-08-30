import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'user.dart';

double last = 50;

class SpinBoxes extends StatelessWidget {
  @override
  String nutrient;
  User user1=User();
  int nutValue;
  //if (nutrient == "carbohydartes"){}
  //String unit = (nutrient.toUpperCase() == "CHOLESTROL" || nutrient.toUpperCase() == "FIBRE")? "mg" : "g";
  SpinBoxes(this.user1, this.nutrient);
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Text(nutrient.toUpperCase()+"\n(in g) ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            //Text("mg", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),

            Container(
              height: 60,
              width: 150,
              child: SpinBox(
                min: 1,
                max: 2000,
                value: 0,
                onChanged: (value) {
                    last = value;
                },
              ),
            ),
            IconButton(
              color: Colors.green.shade900,
      icon: Icon(Icons.send,size: 30,),
              //shape: Border.all(width: 2, color: Colors.blueGrey),
                onPressed: () {
                    if(user1.nutrientVal == null){
                      user1.nutrientVal = [last.toInt()];
                    } else {
                      user1.nutrientVal.add(last.toInt());
                    }
                    print(user1.nutrientVal);

                },
                //visualDensity: VisualDensity.adaptivePlatformDensity,

            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
