import 'package:animations/animations.dart';
import 'package:balancedbites/recommendations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:balancedbites/meal.dart';
import 'package:balancedbites/user.dart';

class homeScreen extends StatefulWidget {
  User user1 = User();
  homeScreen({this.user1});
  _homeScreenState createState() => _homeScreenState(user1);
}

class _homeScreenState extends State<homeScreen> {
  User user1 = User();
  @override
  _homeScreenState(this.user1);
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 40, left: 32, right: 16, bottom: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            "BALANCED BITES",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Text(
                            ""
                                "Hello, ${user1.name}!",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          trailing:
                          ClipOval(child: Image.asset("images/user.png")),
                        ),
                        Row(
                          children: [
                            _RadialProgress(
                              width: height * 0.2,
                              height: height * 0.2,
                              progress: 0.7,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var item = 0;
                                item < user1.nutrients.length;
                                item++)
                                  _DietProgress(
                                    nut: user1.nutrients[item],
                                    progress: 0.7,
                                    progressColor: Colors.green,
                                    leftAmount: 720,
                                    width: width * 0.35,
                                  ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      ])),
            )),
        Positioned(
          top: height * 0.38,
          left: 0,
          right: 0,
          child: Container(
            height: height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 32,
                    right: 16,
                  ),
                  child: Text(
                    "FOOD YOU HAD TODAY",
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                if (meals.isEmpty)
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 32, right: 32, bottom: 10),
                    child: Container(
                      height: height * 0.22,
                      //width: width,

                      //decoration: BoxDecoration(color: Colors.indigoAccent),

                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          "images/sad_basket.png",
                          height: height * 0.22,
                          width: width, fit: BoxFit.cover,
                          //color:Colors.yellow,
                        ),
                      ),
                    ),
                    /*Text("Your food list is empty"),*/
                    /* Text("Oops your food list is empty.\n Just click on the camera icon and get started"),*/
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32,
                          ), for (int i = 0; i < meals.length; i++)
                            _MealCard(meal: meals[i]),
                        ],
                      ),
                    ),
                  ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: OpenContainer(
                      closedElevation: 5,
                      transitionType: ContainerTransitionType.fadeThrough,
                      transitionDuration: const Duration(milliseconds: 1000),
                      //openColor: Colors.pink,
                      closedColor: const Color(0xFFE9E9E9),
                      openBuilder: (context, _) {
                        return Recommendations();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: const EdgeInsets.only(left: 32, right: 32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                //begin: Alignment.topCenter,
                                //end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text("NEED HELP DECIDING",
                                        style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text("Check These Out",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: const Color(0xFF5B4D9D),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    Color(0xFF5B4D9D),
                                                    BlendMode.color),
                                                child: Image.asset(
                                                  "images/cholestrol.png",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text("Low \n Cholestrol",
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: const Color(0xFF5B4D9D),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                              child: Image.asset(
                                                "images/energy.png",
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text("High \n Energy",
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: const Color(0xFF5B4D9D),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(25),
                                            child: Image.asset(
                                              "images/fibres.jpg",
                                              width: 30,
                                              height: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Text("High \n Fibre",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ))
                                      ]),
                                      SizedBox(width: 10),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: const Color(0xFF5B4D9D),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    Color(0xFF5B4D9D),
                                                    BlendMode.color),
                                                child: Image.asset(
                                                  "images/fat.png",
                                                  width: 30,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Low \n Fat",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: const Color(0xFF5B4D9D),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(25),
                                              child: Image.asset(
                                                "images/protein.jpeg",
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text("High \n Protein",
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: progress),
      child: Container(
        height: width * 0.8,
        width: width * 0.8,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "2000",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "kcal left",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF200073),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 8
      ..color = Color(0xFF200087)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double relativesProgress = 360 * progress;
    //canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      math.radians(-90),
      math.radians(-relativesProgress),
      false,
      paint,
    );
  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _DietProgress extends StatelessWidget {
  final String nut;
  final int leftAmount;
  final double progress;
  final Color progressColor;
  final double width;
  const _DietProgress(
      {Key key,
        this.nut,
        this.leftAmount,
        this.progress,
        this.progressColor,
        this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nut,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(children: [
              Container(
                height: 8,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.black12,
                ),
              ),
              Container(
                height: 8,
                width: width * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: progressColor,
                ),
              ),
            ]),
            SizedBox(width: 10),
            Text("${leftAmount} left"),
          ],
        )
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  Meal meal;

  _MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right:20),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset('images/pizza.jpg',
                      width: 150, fit: BoxFit.fitWidth),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        meal.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(meal.protein),
                      Text(meal.fat),
                      //Text(meal.carbs),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
