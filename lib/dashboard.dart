import 'package:balancedbites/user.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import "package:balancedbites/homeScreen.dart";
class Dashboard extends StatefulWidget {
  User user1 = User();
  Dashboard(this.user1);
  @override
  _DashboardState createState() => _DashboardState(user1);
}

class _DashboardState extends State<Dashboard> {
  User user1 = User();
  _DashboardState(this.user1);
  @override
  List<Slide> slides = new List();
  @override
  updateNutrients(){
    setState(() {

    });
  }

  void initState() {
    super.initState();
    for(int i = 0; i< user1.nutrients.length; i++) {
      slides.add(

        Slide(
          title:
          "${user1.nutrients[i].toUpperCase() }",

          styleTitle:
          TextStyle(color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,),
              //fontFamily: 'Pacifico'),
          /*description:"ABC",
          //"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
          styleDescription:
          TextStyle(color: Colors.white,
              fontSize: 20.0,
              fontStyle: FontStyle.italic,),*/
              //fontFamily: 'Raleway'),
          /*marginDescription: EdgeInsets.only(
              left: 20.0, right: 20.0),)*/
          centerWidget:Column(
            children: [
              /*Text("${user1.nutrients[i]}\n ",style:TextStyle(color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,),),*/
              Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 90, width: 90,
                    child: CircularProgressIndicator(value:user1.presentVal[i]/user1.nutrientVal[i] ,
                      strokeWidth: 12,backgroundColor: Colors.white,valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade500),)),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text("Consumed: ${user1.presentVal[i].toStringAsFixed(2)}",style: TextStyle(fontStyle: FontStyle.italic,color: Colors.pink.shade500,),),
                      SizedBox(height: 15),
                      (user1.presentVal[i] > user1.nutrientVal[i])?
                      Text("Exceeded: ${(-user1.nutrientVal[i] + user1.presentVal[i]).toStringAsFixed(2)}",
                        style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,),)
                      :Text("Left: ${(user1.nutrientVal[i] - user1.presentVal[i]).toStringAsFixed(2)}",
                        style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,),),
                      SizedBox(height: 15),

                    ],
                  )
                ],
              ),
            ),
             ],
          ),
          colorBegin: Color(0xffFFDAB9),
          colorEnd: Color(0xff40E0D0),
          //backgroundImage: 'images/photo_eraser.png',
          directionColorBegin: Alignment.topLeft,
          directionColorEnd: Alignment.bottomRight,
          onCenterItemPress: () {},
        ),
      );
    }
    /*slides.add(
      new Slide(
        title: "MUSEUM",
        styleTitle:
        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description: "Ye indulgence unreserved connection alteration appearance",
        styleDescription:
        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "images/photo_museum.png",
        colorBegin: Color(0xffFFFACD),
        colorEnd: Color(0xffFF6347),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "COFFEE",
        styleTitle:
        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription:
        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
        pathImage: "images/photo_coffee_shop.png",
        colorBegin: Color(0xffFFA500),
        colorEnd: Color(0xff7FFFD4),
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );*/

  }

  /*void onDonePress() {
    // Do what you want
    *//*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),*//*
    //);
  }*/

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  /*Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }
*/
  Widget renderSkipBtn() {
    return Icon(
      Icons.keyboard_arrow_down,
      size: 35,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,

      child: IntroSlider(
        isScrollable: true,
        // List slides
        slides: this.slides,

        // Skip button
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: Color(0x33000000),
        //highlightColorSkipBtn: Color(0xff000000),

        // Next button
        renderNextBtn: this.renderNextBtn(),
        isShowDoneBtn: false,
        isShowNextBtn: false,
        // Done button
        /*nameSkipBtn: "Scroll down for more info",
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: Color(0x33000000),
        highlightColorDoneBtn: Color(0xff000000),*/

        // Dot indicator
        colorDot: Color(0x33D02090),
        colorActiveDot: Color(0xffD02090),
        sizeDot: 11.0,

        // Show or hide status bar
        shouldHideStatusBar: true,
        //backgroundColorAllSlides: Colors.yellow,
      ),
    );
  }
}

