import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Model/note.dart';

class BoxNote extends StatelessWidget {
  final Note n1 ;
  final VoidCallback onTap;
  const BoxNote({super.key,required this.n1, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(n1.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: const Color.fromARGB(107, 0, 0, 0)),),
                Icon(FontAwesomeIcons.thumbtack,color: Colors.black,),
              ],
            ),
            SizedBox(height: 15,),
            Text(n1.content,maxLines: 4,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}