import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session7/providers/notes_provider.dart';

import '../models/entities/note_model.dart';

class NotesViewWidget extends StatelessWidget {

  NoteModel noteModel;

  NotesViewWidget({required this.noteModel});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<NotesProvider>(context);
    return ListTile(
      onTap: () {

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Edit Note"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Title",
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      noteModel.title = value;
                    },
                    controller:
                    TextEditingController(text: noteModel.title),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Content",
                        border: OutlineInputBorder()),
                    onChanged: (value) {
                      noteModel.content = value;
                    },
                    controller:
                    TextEditingController(text: noteModel.content),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    provider.updateNote(noteModel.id!,
                        NoteModel(title: noteModel.title, content: noteModel.content)
                    );
                    Navigator.pop(context);
                  },
                  child: Text("save"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("cancel"),
                ),
              ],
            ));
      },
      title: Text(noteModel.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      subtitle: Text(noteModel.content,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
    );
  }
}
