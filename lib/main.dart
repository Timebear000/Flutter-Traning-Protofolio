import 'package:flutter/material.dart';
import 'package:portfolio/screen/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: ProfilePage(),
    );
  }
}
