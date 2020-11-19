import 'package:flutter/material.dart';
import 'package:flutter_database_1/database/note_dao.dart';
import 'package:flutter_database_1/database/note_table.dart';
import 'package:flutter_database_1/screen/add_screen.dart';
import 'package:flutter_database_1/screen/update_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  List<Note> notelist = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Database Flutter"),
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              Get.to(AddScreen());
            },
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
              heroTag: 'delete',
              onPressed: () {
                noteDao.deleteAllNote(notelist);
              },
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.delete,
              )),
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNote(),
      builder: (_, snapshop) {
        if (snapshop.hasData) {
          notelist = snapshop.data;
          return ListView.builder(
            itemCount: snapshop.data.length,
            itemBuilder: (_, index) {
              return Card(
                  child: ListTile(
                title: Text(snapshop.data[index].title),
                subtitle: Text(snapshop.data[index].message),
                // ignore: missing_required_param
                trailing: IconButton(
                  onPressed: () {
                    noteDao.deleteNote(snapshop.data[index]);
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.to(UpdateScreen(), arguments: snapshop.data[index]);
                  },
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
              ));
            },
          );
        } else if (snapshop.hasError) {
          return Text(" Error");
        } else {
          return Text("Loading......");
        }
      },
    );
  }
}
