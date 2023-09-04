class NoteModel{
  late String title;
 late String content;
 String? id;
 NoteModel({required this.title,required this.content,this.id});

 factory NoteModel.fromJson(Map<String,dynamic> json){

  return NoteModel(
      title: json["title"],
      content: json["content"],
      id: json["id"]
  );
 }
 Map<String,dynamic> toJson(){
  return {
   "title":title,
   "content":content
  };
 }
}