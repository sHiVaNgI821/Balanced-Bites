import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:balancedbites/addFoodItem.dart';
import 'package:balancedbites/recomm_cards.dart';
import 'package:balancedbites/recommendations.dart';
import 'package:balancedbites/selection.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:balancedbites/user.dart';
import 'package:balancedbites/search_screen.dart';
import 'package:balancedbites/homeScreen.dart';

class functionality extends StatefulWidget {
  @override
  User user1 = User();
  functionality(this.user1);
  _functionalityState createState() => _functionalityState(user1);
}

class _functionalityState extends State<functionality>
    with TickerProviderStateMixin {
  User user1 = User();

  _functionalityState(this.user1);
  int selectedPage = 2;
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[Icons.restaurant, Icons.search];

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.2,
        1,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _pageList = [
      LandingScreen(),
      TextApp(),
      homeScreen(user1: user1),
    ];
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFE9E9E9),
        body: _pageList[selectedPage],
        floatingActionButton: ScaleTransition(
          scale: animation,
          child: FloatingActionButton(
            elevation: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.home,
              //color: HexColor('#373A36'),
              color: Colors.grey,
            ),
            onPressed: () {
              _animationController.reset();
              _animationController.forward();
              setState(() {
                selectedPage=2;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          iconSize: 30,
          icons: iconList,
          //backgroundColor: HexColor('#373A36'),
          backgroundColor: Colors.grey,
          activeIndex: selectedPage,
          activeColor: Colors.white,
          splashColor: HexColor('#FFA400'),
          inactiveColor: Colors.white,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 15,
          rightCornerRadius: 15,height:65,
          onTap: (index) => setState(() {
            selectedPage = index;
          }),
        ));
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

