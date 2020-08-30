import 'package:flutter/material.dart';
import 'recomm_cards.dart';

final List<Tab> tabs = <Tab>[
  Tab(text:"Instant \n Energy"),
  Tab(text: "High \n Fiber"),
  Tab(text: 'Low \n Cholestrol'),
  Tab(text: 'High \n Protein'),
  Tab(text: 'Low \n fat'),

];

/// This is the stateless widget that the main application instantiates.
class instantEnergy extends StatelessWidget{

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children:[
          recommCards("Cheese Plate", "Energy (in cal): ", 662, 662, 8.3, 0.5, 45, 50, 0, 0.168),
          recommCards("Beef Tartare", "Energy (in cal): ", 552, 552, 5.7, 1.8, 33, 44, 1.4, 0.034),
          recommCards("Huevos Rancheros", "Energy (in cal): ", 477.044, 477.044, 25,6.82, 36.36, 25, 9.1, 0.761),
          recommCards("Foi Gras", "Energy (in cal): ", 461.5, 461.5, 4.7, 0, 11.5, 43.8, 0, 0.153),
          recommCards("Baklava", "Energy (in cal): ", 429.244, 429.244, 41.28, 25.9675, 4.33, 23.3975, 1.825, 0.00975),
        ]);
  }
}

class highFiber extends StatelessWidget{

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children:[
          recommCards("Seaweed Salad", "Fiber (in mg): ", 18.33333333 ,85.64166667,	14.97666667,	14.5,	0.333333333,	4.406666667,	18.33333333,	0),
          recommCards("Falafel", "Fiber (in mg): ", 12, 364.41525,	48.96,	7.24,	18.11,	16.7575,	12,	0),
          recommCards("Hot Dog", "Fiber (in mg): ", 11.6, 185.942,	44.19,	4.65,	9.3,	2.33,	11.6,	0),
          recommCards("Miso Soup", "Fiber (in mg): ", 10.8	, 375.947,	43.01,	21.51,	21.51,	10.75,	10.8,	0),
          recommCards("Huevos Rancheros", "Fiber (in mg): ",	9.1, 477.044,	25,	6.82,	36.36,	25,	9.1,	0.761),
        ]);
  }
}

class lowCholestrol extends StatelessWidget{

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children:[
          recommCards("French Fries", "Cholestrol (in mg): ",	0, 141.01,	22.355,	0.59,	2.94,	5,	2.4,	0),
          recommCards("Guacamole", "Cholestrol (in mg): ",	0, 145.1071429,	8.457857143,	2.886428571,	2.763571429,	12.13,	5.107142857,	0),
          recommCards("Hot Dog", "Cholestrol (in mg): ",	0,	185.942,	44.19,	4.65,	9.3,	2.33,	11.6,	0),
          recommCards("Hummus", "Cholestrol (in mg): ",	0, 204.7013273,	16.56254545,	2.865090909,	6.172181818,	13.32836364,	4.727272727,	0),
          recommCards("Miso Soup", "Cholestrol (in mg): ",	0, 375.947, 43.01,	21.51,	21.51,	10.75,	10.8,	0),
        ]);
  }
}

class highProtein extends StatelessWidget{

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children:[
          recommCards("Cheese Plate", "Protein (in mg): ", 45, 662, 8.3, 0.5, 45, 50, 0, 0.168),
          recommCards("Huevos Rancheros", "Protein (in mg): ", 36.36,477.044, 25,6.82, 36.36, 25, 9.1, 0.761),
          recommCards("Beef Tartare", "Protein (in mg): ", 33, 552, 5.7, 1.8, 33, 44, 1.4, 0.034),
          recommCards("Pork Chop", "Protein (in mg): ", 26, 210,	0,	0, 26,	11,	0,	0.84),
          recommCards("Steak", "Protein (in mg): ",	26, 280,	0,	0,	26,	18,	0,	0.097),
        ]);
  }
}

class lowFat extends StatelessWidget{

  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top: 20.0),
        children:[
          recommCards("Scallops", "Fat (in mg): ",	0.798, 84.1758,	2.304,	0,	14.776,	0.798,	0,	0.0334),
          recommCards("Gnocchi", "Fat (in mg): ", 0.841428571, 199.8722857,	42.12142857,	1.272857143,	5.28,	0.841428571,	1.9,	0.001285714),
          recommCards("Ceviche", "Fat (in mg): ", 1.3, 82,	2.6,	1,	15,	1.3,	0.5,	0.038),
          recommCards("Escargots", "Fat (in mg): ", 1.4, 90.6,	2,	0,	16.5,	1.4,	0,	0.056),
          recommCards("Ramen", "Fat (in mg): ", 2, 359.934,	68,	4,	16,	2,	8,	0),
        ]);
  }
}

/// This is the stateless widget that the main application instantiates.
class Recommendations extends StatelessWidget {
  Recommendations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      //child: Builder(builder: (BuildContext context) {
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return MaterialApp(
            home:Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("RECOMMENDATIONS",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
                  bottom: TabBar(
                    tabs: tabs,
                  ),
                  backgroundColor: Colors.orangeAccent[400],
                ),
                body: TabBarView(
                  // children: tabs.map((Tab tab) {
                  children: [
                    instantEnergy(),
                    highFiber(),
                    lowCholestrol(),
                    highProtein(),
                    lowFat(),
                  ],
                )
              // }).toList(),
            )
        );
      }),
    );
  }
}
