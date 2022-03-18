import 'package:delivery_app/src/bloc/delivery_bloc.dart';
import 'package:delivery_app/src/bloc/events.dart';
import 'package:delivery_app/src/models/login_request.dart';
import 'package:delivery_app/src/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      
    );
  }
}

