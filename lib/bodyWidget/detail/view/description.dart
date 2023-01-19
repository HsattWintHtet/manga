import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String description;

  const Description({Key key, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description,style:TextStyle(fontFamily:"Pyidaungsu"),),
        ),
      ),
    );
  }
}