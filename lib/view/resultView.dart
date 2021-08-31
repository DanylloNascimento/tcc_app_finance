import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultView extends StatelessWidget {
  // receive data from the FirstScreen as a parameter
  ResultView({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  
}
