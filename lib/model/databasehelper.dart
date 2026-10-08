import 'dart:ui';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class databasehelper{
  Database? _db;
  Future<Database>getdb()async{
    if(_db !=null){
      return _db!;
    }
    _db=await initdatabase();
    return _db!;

  }
  Future<Database>initdatabase()async{

    return  openDatabase("notenew.db",version: 1,onCreate: (db,version) async {
      await db.execute("create table notes(id integer primary key autoincrement, title text not null,body text not null, color integer,isfav integer default 0,date text )");
    });
  }
  Future<void> insert(note n)async{
    final db=await getdb();
    final id= await db.insert("notes", n.tomap());
    n.id=id;
  }
  Future<void> delete(note n)async{
    final db=await getdb();
    await db.delete("notes",where: "id=?",whereArgs: [n.id]);
  }
  Future<void>update(String title,String body,Color? c,int id)async{
    final db=await getdb();
    await db.update("notes", {"title":title,"body":body,"color":c!=null?c.toARGB32():null},where: "id=?",whereArgs: [id]);
  }
  Future<void> updateisfavtrue(note n)async{

    final db=await getdb();
    await db.update("notes", {"isfav":1},where: "id=?",whereArgs: [n.id]);
  }
  Future<void> updateisfavfalse(note n)async{

    final db=await getdb();
    await db.update("notes", {"isfav":0},where: "id=?",whereArgs: [n.id]);
  }
  Future<List<note>> getnotes()async{
    List<note>notes=[];
    final db=await getdb();
    final List<Map<String,dynamic>>data=await db.query("notes");
    for(var ks in data){
      notes.add(note.fromjson(ks));
    }
    return notes;
  }
}