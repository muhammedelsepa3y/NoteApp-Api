import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/entities/note_model.dart';
import '../providers/notes_provider.dart';
import 'notes_view_widget.dart';

class SearchNotesDelegate extends SearchDelegate {
  Widget buildSearchBar(BuildContext context) {
    return TextField(
      onChanged: (value) {
        query = value;
      },
      decoration: InputDecoration(
        labelText: "Search",
        border: OutlineInputBorder(),
      ),);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query = "";
    }, icon: Icon(Icons.clear))];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider=Provider.of<NotesProvider>(context);
      return FutureBuilder(
        future: provider.searchNotes(query),
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
                  child:  NotesViewWidget(
                    noteModel: snapshot.data![index],
                  ),
                );
              },
            );
          }
          return Center(child: Text("no data"),);
        },
      );


  }
}
