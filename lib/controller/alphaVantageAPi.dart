import 'dart:async';
import 'dart:convert';
import 'package:app_acoesfinancas/model/action.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Action> fetchAction() async {
  final response = await http.get(Uri.parse(
      'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=CK3RH5LVP2G60AQ8'));

  if (response.statusCode == 200) {
    
    return Action.fromJson((jsonDecode(response.body)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

class Action {
  final String  open, high, low, close, volume;

  Action(
      {
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
        
        open: json['open'],
        high: json['high'],
        low: json['low'],
        close: json['close'],
        volume: json['volume']);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Action> futureAction;

  @override
  void initState() {
    super.initState();
    futureAction = fetchAction();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Action>(
            future: futureAction,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.close);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
