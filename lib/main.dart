import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/Model/note_provider.dart';
import 'package:note_app/Scrreen/home_screen.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(ChangeNotifierProvider(
    create: (context) => NoteProvider(),
    child: app()));
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