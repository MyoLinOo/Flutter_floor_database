import 'package:flutter/material.dart';
import 'package:flutter_database_1/database/note_dao.dart';
import 'package:flutter_database_1/database/note_table.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  final NoteDao noteDao = Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                hintText: ("title"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                  hintText: ("title"), border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          if (titleController.text != null && messageController.text != null) {
            Get.back();
            await noteDao.addNote(Note(titleController.text.toString(),
                messageController.text.toString()));
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
