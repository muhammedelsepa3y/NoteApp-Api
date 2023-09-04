import 'package:flutter/widgets.dart';

import '../models/entities/note_model.dart';
import '../models/model_logic/note_logic.dart';

class NotesProvider extends ChangeNotifier{



    Future addNote(NoteModel note)async{
      try{
      await NoteLogic.addNote(note) ;
       notifyListeners();
      }catch(e){
        rethrow;
      }
    }
    Future<List<NoteModel>> getNotes()async{
      try{
        final response=await NoteLogic.getNotes()as List<NoteModel>;
        return response;
      }catch(e){

        return [];
      }
    }
    Future deleteNote(String id)async{

      try{
        await NoteLogic.deleteNote(id) ;
        notifyListeners();
      }catch(e){
        rethrow;
      }
    }
    Future updateNote(String index,NoteModel note)async{
      try{
        await NoteLogic.editNote(index,note) ;
        notifyListeners();
      }catch(e){
        rethrow;
      }

    }
    Future<List<NoteModel>> searchNotes(String query)async{
      try{
        final response=await NoteLogic.getNotes()as List<NoteModel>;
        return response.where((element) =>
        element.content.toLowerCase().contains(query.toLowerCase())||
            element.title.toLowerCase().contains(query.toLowerCase())
        ).toList();
      }catch(e){

        return [];
      }

    }



}