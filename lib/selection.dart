import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:balancedbites/functionality.dart';
import 'package:balancedbites/recommendations.dart';
import 'spinbox.dart';
import 'user.dart';

class SpinBoxInput extends StatefulWidget {
  @override
   User user1 =User();
   List<String> list;
  SpinBoxInput({@required this.user1, @required this.list});
  _SpinBoxInputState createState() => _SpinBoxInputState(user1: user1, nut_list: list);
}

class _SpinBoxInputState extends State<SpinBoxInput> {
  @override
  User user1;
  List<String> nut_list;
  _SpinBoxInputState({@required this.user1, @required this.nut_list});
  void upadateTheUser(){

  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<int> nutrientValues;

  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        //width:500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/goal2.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstATop),
          ),

        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                backgroundColor: Colors.orangeAccent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Let\'s set a goal', style: TextStyle(fontSize: 25),),
                  background: Image.asset('images/appbar.PNG', fit: BoxFit.fitHeight,),
                ),
              ),
             SliverToBoxAdapter(
               child: Container(
                 child: Padding(
                    padding: const EdgeInsets.fromLTRB(55, 40, 55, 30),
                       child: Center(child: Text('Hello ${user1.name} !!! ',
                         style: TextStyle(fontFamily:'Pacifico', fontSize: 35, color: Colors.green.shade900 ), ),),
               ),

             ),
           ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                  if(index>=nut_list.length)return null;
                  return SpinBoxes(user1, nut_list[index]);
                }
                ),

              ),
              SliverToBoxAdapter(
                child: Center(
                  child: RaisedButton(
                      child: Text("Finished", style: TextStyle(fontSize: 24),),
                      shape: Border.all(width: 2,color: Colors.blueGrey),
                      onPressed: () {
                        print(user1.name);
                        print(user1.nutrients);
                        print(user1.nutrientVal);
                        Navigator.push(
                            context,
                            MaterialPageRoute( builder: (context) => Scaffold( body: functionality(user1),
                                  //functionality(user1),
                                )
                            )
                        );
                      },
                  ),
                ),


              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                ),
              )

            ],
          )
          /*SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("LET'S SET A GOAL",style: TextStyle(fontSize: 40),),
                  SizedBox(
                    height: 40,
                  ),

                  for (var item in nut_list) SpinBoxes(user1, item),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      onPressed: () {
                        print(user1.name);
                        print(user1.nutrients);
                        print(user1.nutrientVal);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  body: functionality(user1),
                                  //functionality(user1),
                                )
                            )
                        );
                      },
                      child: Text("Finished"))
                ],
      ),
              ),
            ),
          ),*/
        ),
    ))
    ;

    /*RaisedButton(
      onPressed:null;
    );*/
  }
}
