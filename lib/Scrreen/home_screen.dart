import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Model/boxnote.dart';
import 'package:note_app/Model/note.dart';
import 'package:note_app/Model/note_provider.dart';
import 'package:note_app/Scrreen/fullpage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController =TextEditingController();
    final TextEditingController _contentController =TextEditingController();
    return Scaffold(
      
      body: Stack(
        children: [
          Image.asset(
            "assets/download (8).jpeg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              children: [
                _headerApp(context,_titleController,_contentController),
                SizedBox(height: 25),
                _subTitleApp(context),
                SizedBox(height: 25),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: _contentNote(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerApp(BuildContext context,TextEditingController _contentController ,TextEditingController _titleController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Home",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          // SizedBox(width: 70,),
          Row(
            children: [
              Icon(Icons.search, size: 35, color: Colors.black),
              SizedBox(width: 10),
              IconButton(onPressed: () {
                //add new ilem when i prssed ok
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(20),
                    title: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                    content:  SizedBox(
                      width: 900,
                      child: TextField(
                      controller: _contentController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write your note...',
                      ),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      maxLines: 3,
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: (){
                        context.read<NoteProvider>().addItem(_titleController.text, _contentController.text);
                      }, child: Text("Add",style: TextStyle(color: Colors.black,fontSize: 17),)),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Cancel",style: TextStyle(color: Colors.black,fontSize: 17))),
                    ],
                  );
                });
              },icon:Icon(Icons.add, size: 35, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _subTitleApp(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),

      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to One Note",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 10),
              Text(
                "Watch Some Quick Tutoriel on youtube ",
                style: TextStyle(
                  color: const Color.fromARGB(113, 0, 0, 0),
                  fontSize: 17,
                ),
              ),
              Text(
                "to used it more efficent",
                style: TextStyle(
                  color: const Color.fromARGB(113, 0, 0, 0),
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                child: Text(
                  "Watch Tutorial",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset("assets/notebook.png", width: 100, height: 100),
          ),
        ],
      ),
    );
  }

  Widget _contentNote(BuildContext context) {
    final  ourNotes = context.watch<NoteProvider>().getLocat_note;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: ourNotes.length,
      itemBuilder: (context, index) {
        
        return BoxNote(
          n1: ourNotes[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Fullpage(n2: ourNotes[index])),
            );
          },
        );
      },
    );
  }
}
