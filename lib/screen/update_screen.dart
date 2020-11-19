import 'package:flutter/material.dart';
import 'package:flutter_database_1/database/note_dao.dart';
import 'package:flutter_database_1/database/note_table.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatelessWidget {
  final NoteDao noteDao = Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Note note = Get.arguments;
    titleController.text = note.title;
    messageController.text = note.message;

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
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
            await noteDao.updateNote(Note(titleController.text.toString(),
                messageController.text.toString(),
                id: note.id));
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
