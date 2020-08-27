import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:balancedbites/MultiSelectChip.dart';
import 'package:balancedbites/selection.dart';
import 'package:balancedbites/user.dart';

void main() => runApp(MaterialApp(
  title: "App",
  home: MyApp(),
));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User _user1 = User();

  void updateUser(String value) {
    setState(() {
      _user1.name = value;
    });
  }
  void updateNutrient(List<String> value) {
    setState(() {
      _user1.nutrients = value;
    });
  }
  List<String> selectedReportList = List();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.fitHeight,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.dstATop),)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orangeAccent,
            title: Text('Balanced Bites',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Pacifico'

              ),),
            centerTitle: true,

          ),
          body: SafeArea(

              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  Text(
                    'WELCOME !!',
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                    ),
                  ),

                  Form(
                    key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(55.0, 20.0, 55.0, 20.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Can we know your name?",
                                  fillColor: Colors.white70,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.black54),
                              ),
                              style: TextStyle(color: Colors.black),
                                onSaved: (String value) {
                                  print(value);
                                  //this._user1.name = value;
                                  updateUser(value);
                                }
                            ),
                          ),
                          Center(
                            child: Text('Which of these would you like to track?',
                              style: TextStyle(

                                color: Colors.white,
                                fontSize: 21.0,
                                  fontFamily: 'Pacifico'
                              ),
                            ),
                          ),
                          MultiSelectChip(
                            ["Protein", "Carbohydrates", "Calories", "Fat", "Fibre","Cholestrol", "Sugar"],
                            onSelectionChanged: (selectedList) {
                              setState(() {
                                selectedReportList = selectedList;
                              });
                            },
                          ),
                          Container(
                            child: RaisedButton(
                              child: Text("Let's go"),
                              onPressed: (){
                                updateNutrient(selectedReportList);
                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                }
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(
                                  body: SpinBoxInput(
                                      user1: _user1, list: selectedReportList),
                                ),
                                ),
                                );
                              },
                            ),
                          ),
                        ],
                  ),
                  ),
                  ],

              ),
          ),
    ),
      ),



    );
  }
}

