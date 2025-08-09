import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/Model/boxnote.dart';
import 'package:note_app/Model/note.dart';
import 'package:note_app/Scrreen/fullpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                _headerApp(context),
                SizedBox(height: 25),
                _subTitleApp(context),
                SizedBox(height: 25),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: _contentNote(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerApp(BuildContext context) {
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
                    title: TextField(
                    // controller: _titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,

                      hintText: 'Write your note...',
                    ),
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  content:  TextField(
                    
                    // controller: _titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // hintText: 'Write your note...',
                    ),
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),
                  
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

  Widget _contentNote() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        Note N = Note(
          id: 99,
          title: "Design",
          content:
              "have 3 think to do keep your mind shrap,have 3 think to do keep your mind shrap,have 3 think to do keep your mind shrap",
        );
        return BoxNote(
          n1: N,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Fullpage(n2: N)),
            );
          },
        );
      },
    );
  }
}
