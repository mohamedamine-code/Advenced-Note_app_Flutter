import 'package:flutter/material.dart';
import 'package:note_app/Model/note.dart';

class NoteProvider extends ChangeNotifier {
  // Lsit Note
  List<Note> Local_note=[
    Note(id: 1,title: "Welcome To Our App", content: "hey , guyess have good experince with us in our first lanch"),
    Note(id: 2,title: "Welcome To Our App", content: "hey , guyess have good experince with us in our first lanch"),
    Note(id: 3,title: "Welcome To Our App", content: "hey , guyess have good experince with us in our first lanch"),
  ];

  // methode get List 
  List<Note> get getLocat_note => Local_note;

  // Methode to add item  
  void addItem(String title ,String content){
    final newNote = Note(id: Local_note.isEmpty ? 1 : Local_note.last.id+1, title: title, content: content);
    Local_note.add(newNote);
    notifyListeners();
  }


// methode to remove item 
void removeItem(Note x){
  Local_note.remove(x);
  notifyListeners();
}
}