import 'package:floor/floor.dart';
import 'package:flutter_database_1/database/note_table.dart';

@dao
abstract class NoteDao {
  @Query('select * from note')
  Stream<List<Note>> getAllNote();

  @Insert()
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteAllNote(List<Note> note);
}
