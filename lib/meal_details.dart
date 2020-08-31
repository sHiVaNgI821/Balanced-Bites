import 'package:flutter/material.dart';
import 'meal_class.dart';
import 'package:balancedbites/model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'recommendations.dart';
/*class MealDe extends StatefulWidget {
  @override
  _MealDeState createState() => _MealDeState();
}

class _MealDeState extends State<MealDe> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/


class MealDetailScreen extends StatelessWidget {
  /*List<Food> _allValues = [];
  Future<String> _loadFoodAsset() async {
    return await rootBundle.loadString('jsonFiles/nutrition_values.json');
  }

  Future loadPhotos() async {
    List<Food> foodItems = [];
    String jsonFood = await _loadFoodAsset();
    final jsonResponse = json.decode(jsonFood);
    *//*FoodList foodList = FoodList.fromJson(jsonResponse);
    print("food items " + foodList.items[0].name);*//*
    for (var element in jsonResponse) {
      Food food = Food(
          element["product_name"],
          element["energy_100g"],
          element["carbohydrates_100g"],
          element["sugars_100g"],
          element["proteins_100g"],
          element["fat_100g"],
          element["fiber_100g"],
          element["cholesterol_100g"]);
      foodItems.add(food);
      //print(food.name);
      //debugPrint(bookval["product_name"]);
    }
    _allValues = foodItems;
    return foodItems;
  }
  Food filter(value) {
    return _allValues.where((element) =>
        element.name.toLowerCase().contains(value.toLowerCase())).toList()[0];
  }*/
  String meal;
  int groupNo;
  var imgPath;

   MealDetailScreen({Key key, this.meal, this.groupNo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    openURL()
    {
      String my_url='https://www.foodnetwork.com/recipes';
      launch(my_url);
    }
    return Scaffold(
          backgroundColor: const Color(0xFFE9E9E9),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                backgroundColor: const Color(0xFF200087),
                expandedHeight: 300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    children: [
                      if(groupNo == 0) Text('Low Cholestrol')
                      else
                        if(groupNo == 1) Image.asset('High energy')
                        else
                          if(groupNo == 2) Image.asset('High Fibre', fit: BoxFit
                              .cover,)
                          else
                            if(groupNo == 3) Image.asset('Low Fat',
                              fit: BoxFit.cover,)
                            else
                              if(groupNo == 4) Image.asset(
                                'High Protein', fit: BoxFit.cover,)
                    ],
                  ),
                  background: ClipRRect(

                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40)),
                      child: Column(
                        children: [
                          if(groupNo == 0) Image.asset(
                              'images/low cholestrol.jpg', fit: BoxFit.cover)
                          else
                            if(groupNo == 1) Image.asset(
                              'images/instant energy.jpg', fit: BoxFit.cover,)
                            else
                              if(groupNo == 2) Image.asset(
                                'images/high fiber.jpg', fit: BoxFit.cover,)
                              else
                                if(groupNo == 3) Image.asset(
                                  'images/low fat.jpg', fit: BoxFit.cover,)
                                else
                                  if(groupNo == 4) Image.asset(
                                    'images/high_protein.jpg',
                                    fit: BoxFit.cover,)
                        ],
                      )

                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      filter(meal).name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    /*ListTile(

                    title: Text(
                      filter(meal).name.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              "${meal.fat} kcal",
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${meal.carbs} mins",
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),*/
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "NUTRIENT COMPOSITION",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).protein.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).carbs.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).energy.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).fat.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).fibre.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ), Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).cholestrol.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ), Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              filter(meal).sugar.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Text('View Recipe'),
                      onPressed: (){
                        openURL();
                      },
                    )


                  ],
                ),
              ),
            ],
          ),
        );




  }
}