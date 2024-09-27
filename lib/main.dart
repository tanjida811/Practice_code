




import 'package:dipon_test_project/presantaion/screens/list_view.dart';
//import 'package:dipon_test_project/presantaion/screens/search_boxscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewewscreen(),
        // SearchBoxScreen(),
    );
  }
}
