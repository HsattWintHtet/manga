import 'package:flutter/material.dart';
import 'package:zodiac/utils/my_flutter_app_icons.dart';

class StarWidget extends StatefulWidget {
  @override
  _StarWidgetState createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /////////// Aries Sign Start//////////////
          Positioned(
         top: MediaQuery.of(context).size.height*0.30,
          left: MediaQuery.of(context).size.width*0.15,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 8,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.35,
          left: MediaQuery.of(context).size.width*0.60,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 8,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.38,
          left: MediaQuery.of(context).size.width*0.80,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 8,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.43,
          left: MediaQuery.of(context).size.width*0.88,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 8,)),
          
          
          /////////// Aries Sign End//////////////
          
          Positioned(
          top: MediaQuery.of(context).size.height*0.2,
          left: MediaQuery.of(context).size.width*0.63,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.5,
          left: MediaQuery.of(context).size.width*0.25,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.6,
          left: MediaQuery.of(context).size.width*0.8,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.1,
          left: MediaQuery.of(context).size.width*0.3,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.2,
          left: MediaQuery.of(context).size.width*0.63,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.8,
          left: MediaQuery.of(context).size.width*0.7,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.7,
          left: MediaQuery.of(context).size.width*0.3,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.9,
          left: MediaQuery.of(context).size.width*0.2,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.2,
          left: MediaQuery.of(context).size.width*0.63,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
          Positioned(
          top: MediaQuery.of(context).size.height*0.2,
          left: MediaQuery.of(context).size.width*0.63,
          child: Icon(MyFlutterApp.path_396,color: Colors.white,size: 4,)),
      ],
    );
  }
}