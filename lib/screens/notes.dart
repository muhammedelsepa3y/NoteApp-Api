import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/entities/note_model.dart';
import '../widgets/notes_view_widget.dart';
import '../widgets/search_notes_delegate.dart';
import '../providers/notes_provider.dart';

class NotesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<NotesProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String title="";
          String content="";
          showDialog(context: context,
              builder: (context)=>AlertDialog(
                title: Text("Add Note"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value){
                        title = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter title",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      onChanged: (value){
                        content = value;
                      },
                      decoration: InputDecoration(
                        labelText: "content",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    child: Text("Add"),
                    onPressed: (){
                      provider.addNote(
                          NoteModel(title: title, content: content)
                      );
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
          );

        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title:  Text("Note"),
        actions: [
          IconButton(
            onPressed: (){
               showSearch(context: context, delegate: SearchNotesDelegate());
            },
            icon: Icon(Icons.search),
          ),

        ],
      ),
      body: FutureBuilder(
        future: provider.getNotes(),
        builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if (snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                return Dismissible(
                  key: ValueKey(snapshot.data![index]),
                  onDismissed: (direction) {
                    provider.deleteNote(snapshot.data![index].id!);
                  },
                  child: NotesViewWidget(
                    noteModel: snapshot.data![index],
                  ),
                );
              },
            );
          }
          return Center(child: Text("no data"),);
        },
      ),
    );
  }
}
