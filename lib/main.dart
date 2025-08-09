import 'package:flutter/material.dart';
import 'package:note_app/Scrreen/home_screen.dart';

void main(){
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}