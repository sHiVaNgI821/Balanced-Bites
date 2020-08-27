import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class recommCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Material(
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text('FISH CURRY',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text('Protein: 50mg \n Fat: 30mg \n Carbs: 20mg.'),
                hoverColor:Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
