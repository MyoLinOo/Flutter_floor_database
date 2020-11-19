import 'package:flutter/material.dart';
import 'package:flutter_database_1/database/note_database.dart';
import 'package:flutter_database_1/screen/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder<NoteDatabase>(
            future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                Get.put(snapshot.data.noteDao);
                return Home();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return Text("Loading.....");
              }
            },
          ),
        ),
      ),
    );
  }
}
