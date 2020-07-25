import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(
      MyApp()
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numSelected=0;
  @override
  void initState() {
    super.initState();
    numSelected = 0;
  }
  setSelectedRadio(int val) {
    setState(() {
      numSelected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balanced Bites',
      routes: {
        'NextPage':(context)=>SecondRoute()
      },
      home:Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.fitHeight)),
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

                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(55.0, 20.0, 55.0, 20.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Can we know your name?",
                                  fillColor: Colors.white70,
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.black54),
                              ),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Text('Which of these would you like to track?',
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 21.0,
                                fontFamily: 'Pacifico'
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Calories',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                              ),
                              ),
                              Radio(
                                value: 2,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Protiens',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),
                              Radio(
                                value: 3,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Carbs',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                                value: 4,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Fibre',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),
                              Radio(
                                value: 5,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Sugar',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),
                              Radio(
                                value: 6,
                                groupValue: numSelected,
                                onChanged: (val){
                                  setSelectedRadio(val);
                                },
                              ),
                              Text(
                                'Cholestrol',
                                style: TextStyle(

                                  color: Colors.white,
                                  fontSize: 19.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),

                            ],
                          ),
                          Container(
                            child: RaisedButton(
                              child: Text("Let's go"),
                              onPressed: (){
                                Navigator.pushNamed(context, 'NextPage');

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
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
