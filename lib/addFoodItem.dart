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
  String output;
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


  var show =false;
  @override
  Widget build(BuildContext context) {

    var str='Predict';
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
                  (show)? Column(
                    children: [
                      SizedBox(height: 10,),
                      Text(output.toUpperCase(),style: TextStyle(color: Colors.brown,fontSize: 20),),
                    ],
                  ): Text(""),
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
                          'CAMERA',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      RaisedButton(
                        onPressed: _pickImage,
                        color: Colors.brown,
                        child: Text('GALLERY',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height:20),
                  RaisedButton(
                    color: Colors.grey,
                    child: Text("PREDICT",style: TextStyle(color:Colors.white,)),
                    onPressed: () async {
                      return
                        FutureBuilder(
                          future: _uploadImage(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              print("SS:${snapshot.data}");
                              return Align( alignment: FractionalOffset.topCenter,child: Text("${output}",style:TextStyle(color:Colors.red)));
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
                  RaisedButton(
                      color: Colors.grey,
                    child: Text('ADD',style: TextStyle(color:Colors.white,)),
                    onPressed: (){
                      setState(() {
                        show = true;
                      });

                      if (output != null){
                      if(foodList.isEmpty){
                        foodList[0]=filter(output);
                      }
                      else foodList.add(filter(output));
                      //print("FOOD LIST:${foodList[3].name}");
                    }
                    }
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
