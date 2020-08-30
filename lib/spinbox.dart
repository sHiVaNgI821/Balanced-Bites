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
  SpinBoxes(this.user1, this.nutrient);
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(nutrient.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Container(
              height: 60,
              width: 150,
              child: SpinBox(
                min: 1,
                max: 100,
                value: 50,
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
