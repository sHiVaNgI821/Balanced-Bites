import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class recommCards extends StatelessWidget {
  String food, nut_values, nutrient;
  double value, energy, carb, sugar, protein, fat, fiber, cholestrol;

  recommCards(String food, String nutrient, double value, double energy , double carb , double sugar ,double protein,double fat,double fiber,double cholestrol){
    this.food = food;
    this.nutrient = nutrient;
    this.value = value;
    /*this.energy = energy;
    this.carb = carb;
    this.sugar = sugar;
    this.protein = protein;
    this.fat = fat;
    this.fiber = fiber;
    this.cholestrol = cholestrol;
    */
    this.nut_values = "Energy: " + energy.toStringAsFixed(2) + " cal" + "\nCarbohydrates: " + carb.toStringAsFixed(2) + " mg "+ "\nSugar: " + sugar.toStringAsFixed(2) + " mg " +
        "\nProteins: " + protein.toStringAsFixed(2) + " mg " + "\nFat: " + fat.toStringAsFixed(2) + " mg " + "\nFiber: " + fiber.toStringAsFixed(2) + " mg " +"\nCholestrol: " + cholestrol.toStringAsFixed(2) + " mg ";
  }

  @override

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,15,10,0),
      //width: 200,
      //height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        color:Colors.green[600],
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ExpansionTile(
            leading: Icon(Icons.restaurant_menu, size:45.0,color: Colors.white),
            title: Padding(
                padding: EdgeInsets.fromLTRB(20,20,20,0),
                child: Text(food,
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                )),
            subtitle: Padding(
                padding: EdgeInsets.fromLTRB(20,5,20,20),
                child: Text(nutrient + value.toStringAsFixed(2), textAlign: TextAlign.center, style:TextStyle(fontSize:18, color: Colors.white))),
            children: <Widget>[
              Text(nut_values, textAlign: TextAlign.center, style:TextStyle(fontSize:16,color: Colors.white)),
            ]
            ,)]

        ),
      ),);
  }
}