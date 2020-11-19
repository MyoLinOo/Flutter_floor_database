import 'package:floor/floor.dart';
import 'package:flutter_database_1/database/note_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:flutter_database_1/database/note_table.dart';

part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
