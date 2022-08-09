import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'HomeView.dart';


void main(){
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(backgroundColor: Colors.green),
      darkTheme: ThemeData(backgroundColor: Colors.green),
    );
  }
}
