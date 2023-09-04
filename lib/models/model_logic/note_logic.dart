import 'dart:convert';



import '../../constants/endpoints.dart';
import '../api_handler.dart';
import '../entities/note_model.dart';

class NoteLogic{
   static final ApiHandler apiHandler=ApiHandler();
  static Future getNotes ()async{
    const url=BASE_URL+NOTES_ENDPOINT;
    try{
      final response = await apiHandler.makeRequest(url);
      final mapResponse= jsonDecode(response.body) as List;

      return mapResponse.map((e) => NoteModel.fromJson(e)).toList() ;

    }catch(e){

      rethrow;
    }
  }

   static Future deleteNote (String id)async{
     String url="$BASE_URL$NOTES_ENDPOINT/$id";
     try{
       final response = await apiHandler.makeRequest(url,method: "DELETE");
       final mapResponse= jsonDecode(response.body) ;
       print(mapResponse);
     }catch(e){
       rethrow;
     }
   }
   static Future addNote (NoteModel noteModel)async{
     String url="$BASE_URL$NOTES_ENDPOINT";
     try{
       final response = await apiHandler.makeRequest(url,body:noteModel.toJson(),method: "POST");
       final mapResponse= jsonDecode(response.body) ;
       print(mapResponse);
     }catch(e){
       rethrow;
     }
   }
   static Future editNote (String id,NoteModel noteModel)async{
     String url="$BASE_URL$NOTES_ENDPOINT/$id";
     try{
       final response = await apiHandler.makeRequest(url,body: noteModel.toJson(),method: "PUT");
       final mapResponse= jsonDecode(response.body) ;
       print(mapResponse);
     }catch(e){
       rethrow;
     }
   }
}