import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../model/modeprovider.dart';
import 'detailsscreen.dart';

class favscreen extends StatefulWidget {
  const favscreen({super.key});

  @override
  State<favscreen> createState() => _favscreenState();
}

class _favscreenState extends State<favscreen> {
  @override
  Widget build(BuildContext context) {
    List<note>notes=context.watch<notesprovider>().getfavnotes();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back,size: 30,)),
                SizedBox(
                  width: 50,
                ),
                Text("Favorite Notes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
              ],
            ),
          ),
          Expanded(child: notes.isEmpty?Center(child: Text("no favourite notes added"),):Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(itemCount: notes.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 230,mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder:(context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>detailscreen(n: notes[index])));
                },
                child: Card(
                  color: notes[index].color,
                  elevation: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: IconButton(onPressed: (){
                              context.read<notesprovider>().updatefavourat(notes[index]);
                            }, icon: Icon(Icons.favorite_border_outlined,color:notes[index].isfav?Colors.red:null)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(notes[index].title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:context.watch<modeprovider>().isdark! && notes[index].color==null?Colors.white:Colors.black),),
                          SizedBox(
                            height: 10,
                          ),
                          Text(notes[index].body,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 19,color:context.watch<modeprovider>().isdark! && notes[index].color==null?Colors.white:Colors.black54),),
                          SizedBox(
                            height: 56,
                          ),
                          Text(notes[index].date!)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}
