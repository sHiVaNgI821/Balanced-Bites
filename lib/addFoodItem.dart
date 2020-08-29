import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(

    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File _image;

  _pickImage() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    final File file = File(image.path);
    if (image == null) return null;
    setState(() {
      _image = file;
    });
  }



  _clickImage() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    final File file = File(image.path);
    if (image == null) return null;
    setState(() {
      _image = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                backgroundColor: Colors.brown,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Add a food item", style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Pacifico',
                      color: Colors.white), textAlign: TextAlign.left),
                  background: Image.asset(
                    'images/add_food_item.PNG', fit: BoxFit.fitWidth,),

                ),
              ),
              SliverToBoxAdapter(

                child: Container(


                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _image==null?Container(child:Center(child: Text('Choose some image', style: TextStyle(fontSize: 28),)),height: 200):Image.file(File(_image.path), height: 350),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: _clickImage,
                            color: Colors.brown,
                            child: Text('Click a picture', style: TextStyle(
                                fontSize: 18, color: Colors.white
                            ),),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          RaisedButton(
                            onPressed: _pickImage,
                            color: Colors.brown,
                            child: Text('Pick from gallery',style: TextStyle(fontSize: 18,color: Colors.white)),

                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 20,
                ),
              )
            ]
        ),
      ),
    );
  }}