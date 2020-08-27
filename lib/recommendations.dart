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
class Recommendations extends StatelessWidget {
  Recommendations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Text("RECOMMENDATIONS",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return
                 Column(
                children:[
                  Text(
                  "Here is a list of some of the top instant energy foods you could try" ,
                  style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  //style: Theme.of(context).textTheme.headline5,
                ),
              Expanded(
                  child:recommCards()),
                  Expanded(
                      child:recommCards()),
                  Expanded(
                      child:recommCards()),
                  Expanded(
                      child:recommCards()),
                  Expanded(
                      child:recommCards()),
                ],

              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
