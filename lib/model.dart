/*
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Values extends StatefulWidget {
  @override
  _ValuesState createState() => _ValuesState();
}

class _ValuesState extends State<Values> {
  bool isSearching;
  List allValues = [];
  List filteredValues = [];
  getCountries() async {
    var response = await Dio().get('/jsonFiles/nutrition_values.json');
    return response.data;
  }
  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        allValues = filteredValues = data;
      });
    });
    super.initState();
  }
  void _filterCountries(value) {
    setState(() {
      filteredValues = allValues
          .where((product_name) =>
          product_name['name'].toLowerCase()==value.toLowerCase())
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
          onChanged: (value) {
            _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search Country Here",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                filteredValues = allValues;
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredValues.length > 0
            ? ListView.builder(
            itemCount: filteredValues.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> SecondScreen(),
                    settings: RouteSettings(
                      arguments: filteredValues[index],
                    ),
                  ),);
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 8),
                    child: Text(
                      filteredValues[index]['name'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            })
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
*/

class Food{
  final String name;
  final double energy;
  final double carbs;
  final double protein;
  final double sugar;
  final double fat;
  final double fibre;
  final double cholestrol;

  Food(this.name,this.energy,this.carbs,this.sugar,this.protein,this.fat,this.fibre,this.cholestrol);
  /*factory Food.fromJson(Map<String, dynamic> json) {
    return new Food(
      name: json['product_name'] as String,
      energy: json['energy_100g'] as double,
      carbs: json['carbohydrates_100g'] as double,
      protein: json['proteins_100g'] as double,
      sugar: json['sugars_100g'] as double,
      fat: json['fat_100g'] as double,
      fibre: json['fiber_100g'] as double,
      cholestrol: json['cholesterol_100g'] as double,
    );
  }*/
}
/*class FoodList{
  final List<Food> items;
  FoodList({this.items,});
  factory FoodList.fromJson(List<dynamic> parsedJson)
  {
    List<Food> items =  List<Food>();
    items = parsedJson.map((i)=>Food.fromJson(i)).toList();

    return FoodList(
        items: items
    );
  }
}*/
