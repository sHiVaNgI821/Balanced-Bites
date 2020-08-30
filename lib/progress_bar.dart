import 'package:flutter/material.dart';

class DietProgress extends StatefulWidget {
  @override

  String nut;
  int leftAmount;
  double progress;
  Color progressColor;
  double width;
  DietProgress({this.nut, this.leftAmount,this.progress,this.progressColor,this.width});
  _DietProgressState createState() => _DietProgressState(nut: nut,leftAmount: leftAmount,progress: progress,progressColor: progressColor, width: width);
}

class _DietProgressState extends State<DietProgress> {

   String nut;
   int leftAmount;
   double progress;
   Color progressColor;
   double width;
   _DietProgressState({this.nut, this.leftAmount,this.progress,this.progressColor,this.width});
@override
void initState() {
    // TODO: implement initState
    super.initState();
  }
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              Container(
                height: 8,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.black12,
                ),
              ),
              Container(
                height: 8,
                width: width * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: progressColor,
                ),
              ),
            ]),
            SizedBox(width: 10),
            Text("${leftAmount} left"),
          ],
        )
      ],
    );
  }
}
