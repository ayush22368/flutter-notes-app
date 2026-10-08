import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:notesappadvancedversion/model/databasehelper.dart';
import 'package:notesappadvancedversion/model/model.dart';

class notesprovider extends ChangeNotifier{
  List<note> notes=[];
  databasehelper db=databasehelper();
  notesprovider(){
    getnotes();
  }
  List<note>getdata(){
    return notes;
  }
  List<note>getfavnotes(){
     return notes.where((e)=>e.isfav).toList();
  }
  Future<void> getnotes()async{
    notes=await db.getnotes();
    notifyListeners();
  }
  Future<void> add_data(note n)async{
    await db.insert(n);
    notes.add(n);
    notifyListeners();
  }
  Future<void> delete(note n)async{
    await db.delete(n);
    notes.remove(n);
    notifyListeners();
  }
  Future<void> update(note n, String title,String body,Color? c)async{
    await db.update(title,body,c,n.id!);
    n.title=title;
    n.body=body;
    n.color=c;
    notifyListeners();
  }
  Future<void> updatefavourat(note n)async{
    if(!n.isfav){
      n.isfav=true;
      await db.updateisfavtrue(n);
      notifyListeners();
    }
    else{
      n.isfav=false;
      await db.updateisfavfalse(n);
      notifyListeners();
    }
  }


}