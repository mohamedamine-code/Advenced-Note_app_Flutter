import 'package:flutter/material.dart';
import 'package:note_app/Model/note.dart';

class Fullpage extends StatelessWidget {
  final Note n2 ;
  const Fullpage({super.key, required this.n2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                n2.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}