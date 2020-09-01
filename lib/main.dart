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

class _MyAppState extends State<MyApp>{

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

        debugShowCheckedModeBanner: false,
      home:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.fitHeight,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.dstATop),)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          /*appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orangeAccent,
            title: Text('Balanced Bites',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Pacifico'

              ),),
            centerTitle: true,

          ),*/
          body: SafeArea(

              child: Column(


                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  /*CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/user.png'),
                  ),*/

                  Text(
                    'Balanced Bites',
                    style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
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
                              decoration: InputDecoration(focusColor: Colors.orangeAccent,
                                  hintText: "Can we know your name?",
                                  fillColor: Colors.white54,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
                            child: Center(
                              child: Text('Which of these would you like to track?',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 21.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MultiSelectChip(
                              ["PROTEIN", "CARBOHYDRATES", "CALORIES", "FAT", "FIBRE","CHOLESTROL", "SUGAR"],
                              onSelectionChanged: (selectedList) {
                                setState(() {
                                  selectedReportList = selectedList;
                                });
                              },
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top:20.0),


                                child: RaisedButton(//iconSize: 45,
                                  //icon: Icon(Icons.play_circle_filled,color: Colors.white,),

                                  child: Text("DONE"),
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

