import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Model/note.dart';

class Fullpage extends StatelessWidget {
  final Note n2;
  const Fullpage({super.key, required this.n2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    // padding: const EdgeInsets.only(right: 10.0),
                    child: IconButton(onPressed: (){},icon:Icon(Icons.arrow_back, size: 35, color: Colors.black)),
                  ),
                  IconButton(onPressed: (){},icon:Icon(FontAwesomeIcons.bookmark, size: 35, color: Colors.black)),
                ],
              ),
              SizedBox(height: 25),
              Text(
                n2.title,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(n2.content, style: TextStyle(fontSize: 23)),
            ],
          ),
        ),
      ),
    );
  }
}
