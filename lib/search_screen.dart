/*
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void main(){
  runApp(MaterialApp(
    title: "camera",
    home: LandingScreen(),
  ));
}
class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File _image;
  List<String> foodList=["Chowmein","Sushi","Samosa","Pav bhaji"];
  List<String> mainList=[];
  int i=0;
  _pickImage() async{
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    final File file =File(image.path);
    if (image == null) return null;
    setState(() {
      _image = file;
      if(i<4) {
        mainList.add(foodList[i]);
        i = i + 1;
      }

    });
  }
  _clickImage() async{
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    final File file =File(image.path);
    if (image == null) return null;
    setState(() {
      _image = file;
      if(i<4) {
        mainList.add(foodList[i]);
        i = i + 1;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display anything'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _image == null ? Container() : Image.file(File(_image.path),width: 250, height: 250,),

            SizedBox(
              height: 20,
            ),
            for(var item in mainList) Text(item),
            FloatingActionButton(
              onPressed: _clickImage,
              child: Icon(Icons.camera),

            ),
            FloatingActionButton(
              onPressed: _pickImage,
              child: Icon(Icons.image),
            ),
          ],
        ),
      ),
    );
  }
}

*/
//import 'file:///C:/Flutter/camera_feature/lib/Screens/model.dart';
import 'package:flutter/material.dart';

//import 'Screens/model.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:balancedbites/model.dart';
import 'package:characters/characters.dart';
import '';
void main() =>
    runApp(MaterialApp(
      home: TextApp(),
    ));

class TextApp extends StatefulWidget {
  @override
  _TextAppState createState() => _TextAppState();
}

class _TextAppState extends State<TextApp> {
  final myController = TextEditingController();
  List<Food> allValues = [];
  String enteredFood = "apple pie";

  Future<String> _loadFoodAsset() async {
    return await rootBundle.loadString('jsonFiles/nutrition_values.json');
  }

  Future loadPhotos() async {
    List<Food> foodItems = [];
    String jsonFood = await _loadFoodAsset();
    final jsonResponse = json.decode(jsonFood);
    /*FoodList foodList = FoodList.fromJson(jsonResponse);
    print("food items " + foodList.items[0].name);*/
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
    allValues = foodItems;
    return foodItems;
  }

  /*Dio dio=new Dio();
  Response response= await dio.get('/jsonFiles/nutrition_values.json');
  print(response.data.toString())*/
  //static var response =  Dio().get('/jsonFiles/nutrition_values.json');


  Food filter(value) {
    return allValues.where((element) => element.name.toLowerCase().contains(value.toLowerCase()) ).toList()[0];
  }

  /*void _filterValues(value) {
    //print(allValues);
    setState(() {
      filteredValues = allValues.where((name) => name["product_name"].toLowerCase()==value.toLowerCase()).toList();
    });
  }*/

  /* @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: FutureBuilder(
          future: loadPhotos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 350,
                      pinned: true,
                      backgroundColor: Colors.orangeAccent,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text("Know what you eat", style: TextStyle(
                            fontSize: 30,fontFamily: 'Pacifico', color: Colors.green[900]), textAlign: TextAlign.left),
                        background: Image.asset('images/details.PNG', fit: BoxFit.fitHeight,),

                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Enter a dish",

                            ),
                            controller: myController,
                            style: TextStyle(color: Colors.black),
                            /*onChanged: (value){
                _filterValues(value);
              },*/
                          ),
                          RaisedButton(
                            color: Colors.green[300],
                            child: Text('Show',style: TextStyle(fontSize: 18),),
                            onPressed: () {
                              setState(() {
                                enteredFood = myController.text;
                              });
                            },
                          ),
                        ],),

                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[50],

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("${filter(enteredFood).name.toUpperCase()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[100],

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Protien value:   ${filter(enteredFood).protein}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(

                      child: Container(
                          color: Colors.amber[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Energy value:   ${filter(enteredFood).energy}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Carbohydrate value:   ${filter(enteredFood).carbs}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[400],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Fat value:   ${filter(enteredFood).fat}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Fibre value:   ${filter(enteredFood).fibre}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[600],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Cholestrol value:   ${filter(enteredFood).cholestrol}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.amber[700],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Sugar value:   ${filter(enteredFood).sugar}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(100, 20, 100, 120),
                            child: RaisedButton(
                              color: Colors.green[300],
                              onPressed: (){
                                foodList.add(filter(enteredFood));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Add this food',style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ),
                        ),
                        color: Colors.amber[700],
                        height: 200,
                      ),
                    ),
                  ],),
              );
              /*Container(
                padding: new EdgeInsets.all(20.0),
                child: new Row(
                  children: <Widget>[

                    Text(

                        "Hi ${filter(enteredFood).name} and lenght ")
                  //"hello ${snapshot.data[0]}"
                  ],
                ));*/
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return
              new
              CircularProgressIndicator
                (
              );
          },
        )





    );
  }

}