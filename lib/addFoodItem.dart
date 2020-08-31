import 'dart:io';
import 'package:balancedbites/model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:async';

import 'package:http_parser/http_parser.dart';

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
  String food;
  String output='apple pie';
  //final String urlAPI = 'http://127.0.0.1:5000/uploader';

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

  Future<Response> _uploadImage() async {
    try {
      Dio dio = new Dio();
      String filename = _image.path.split('/').last;
      FormData formdata = new FormData.fromMap({
        "file": await MultipartFile.fromFile(_image.path,
            filename: filename, contentType: new MediaType('image', 'jpg')),

      });
     var response = await dio.post('http://lnd.talentsprint.com:5002/uploader',
          data: formdata,
          options: Options(
//            headers: {
//            "accept": '*/*',
//            "Content-Type": 'multipart/form-data',
//          },
            method: 'POST',
            //responseType: ResponseType.plain,
         ));


     output=response.toString();
      print(output);
      return response;
    } catch (e,s) {
      print(e);
      print(s);
    }
  }



  @override
  Widget build(BuildContext context) {
    var str='Predict';
    String output;
    //var temp= _uploadImage();
    Text ShowMessage(){
      setState(() {
        str='hey';
      });
      return Text('Abc');
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: Colors.brown,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Add a food item",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Pacifico',
                      color: Colors.white),
                  textAlign: TextAlign.left),
              background: Image.asset(
                'images/add_food_item.PNG',
                fit: BoxFit.fitWidth,
              ),
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
                  _image == null
                      ? Container(
                          child: Center(
                              child: Text(
                            'Choose some image',
                            style: TextStyle(fontSize: 28),
                          )),
                          height: 200)
                      : Image.file(File(_image.path), height: 350),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: _clickImage,
                        color: Colors.brown,
                        child: Text(
                          'Click a picture',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RaisedButton(
                        onPressed: _pickImage,
                        color: Colors.brown,
                        child: Text('Pick from gallery',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: (){
                      if(foodList[0]==Food('hello',0.0,0.0,0.0,0.0,0.0,0.0,0.0))foodList[0]=filter(output);
                      else foodList.add(filter(output));
                      print(foodList);
                    },
                  ),

                  RaisedButton(
                    color: Colors.brown,
                    child: Text(str),
                    onPressed: () async {
                      return
                      FutureBuilder(
                        future: _uploadImage(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SnackBar(
                              content: Text('done'),
                            );
                            /*Container(color: Colors.black,
                                height: 500,
                                child: Text('${snapshot.data}'));*/
                          } else if (snapshot.hasError) {
                            return new Text("${snapshot.error}");
                          }
                          return Text('hi there');
                        },
                      );
                      /*var temp = await _uploadImage();
                      setState(() {
                        food = temp;
                        print(food);
                      });*/
                    },
                  ),
                  /*Container(
                    child: Text('Prediction: ${food.toString()}'),
                  )*/
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 20,
            ),
          )
        ]),
      ),
    );
  }
}
