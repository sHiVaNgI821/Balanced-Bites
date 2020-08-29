import 'package:balancedbites/recomm_cards.dart';
import 'package:balancedbites/selection.dart';
import 'package:flutter/material.dart';
import 'package:balancedbites/meal.dart';
import 'package:balancedbites/user.dart';

import 'package:balancedbites/search_screen.dart';
import 'package:balancedbites/homeScreen.dart';
class functionality extends StatefulWidget {
  @override
  User user1 = User();
  functionality(this.user1);
  _functionalityState createState() => _functionalityState(user1);
}

class _functionalityState extends State<functionality> {
  User user1 = User();
  int selectedPage=0;
 final _pageList=[
   homeScreen(),
   TextApp(),
   recommCards(),

 ];
  /*@override
  void initState(){
    super.initState();

    selectedPage=0;
     final _pageList=
  }
*/
  _functionalityState(this.user1);

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: _pageList[selectedPage],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          currentIndex: selectedPage,
          onTap: (int index){
            setState(() {
              selectedPage=index;
            });
          },
          unselectedIconTheme: IconThemeData(color: Colors.black54),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                  style: const TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu),
                title: Text(
                  "Add item",
                  style: const TextStyle(color: Colors.black),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_check),
                title: Text(
                  "Recommendations",
                  style: const TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
      /* appBar: AppBar(
          title: Text("LET'S REACH OUR GOAL"),
        ),*/

    );
  }
}

