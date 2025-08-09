import 'package:flutter/material.dart';
import 'package:note_app/Model/note.dart';

class NoteProvider extends ChangeNotifier {
  // Lsit Note
  List<Note> Local_note=[
    Note(id: 1,title: "Welcome To Our App", content: "hey , guyess have good experince with us in our first lanch")
  ];

  // methode get List 

  List<Note> get getLocat_note => Local_note;

  // Methode to add item  

  void addItem(Note x,){
    Local_note.add(x);
    notifyListeners();
  }



}