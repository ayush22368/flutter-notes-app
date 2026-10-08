import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class modeprovider extends ChangeNotifier{
   SharedPreferences? Shared;
  bool? isdark;
  modeprovider(){
    shared();

  }
 ThemeMode? themeMode;
 void shared()async{
    Shared=await SharedPreferences.getInstance();
    if(!Shared!.containsKey("mode")){
      Shared!.setBool("mode", false);
    }
    isdark=Shared!.getBool("mode");
    if(isdark==true){
      themeMode=ThemeMode.dark;
    }
    else{
      themeMode=ThemeMode.light;
    }
    notifyListeners();
 }

 void togglethem()async{
   if(isdark==false){
     isdark=true;
     Shared!.setBool("mode", true);
     themeMode=ThemeMode.dark;
   }
   else{
     isdark=false;
     Shared!.setBool("mode", false);

     themeMode=ThemeMode.light;
   }
   notifyListeners();
 }
}