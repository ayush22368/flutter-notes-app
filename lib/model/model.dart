import 'dart:ui';

class note{
  int? id;
  String title;
  String body;
  bool isfav;
  Color? color;
  String? date;

  note({this.id,required this.title,required this.body,required this.isfav,this.color,required this.date});

  factory note.fromjson(Map<String, dynamic>json) {
    return note(id: json["id"], title: json["title"], body:json["body"], isfav:json["isfav"]==1,color: json["color"]!=null?Color(json["color"]):null,date: json["date"]);
  }
  Map<String,dynamic>tomap(){
    return {"title":title,"body":body,"color":color?.toARGB32(),"date":date};
  }
}