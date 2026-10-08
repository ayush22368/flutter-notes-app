import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/model.dart';
import 'package:notesappadvancedversion/model/modeprovider.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:notesappadvancedversion/screens/addnotescreen.dart';
import 'package:notesappadvancedversion/screens/detailsscreen.dart';
import 'package:notesappadvancedversion/screens/favscreen.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addnotes()));
        },child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.deepPurpleAccent,shape: CircleBorder(),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            // TITLE — NOT SELECTABLE
            ListTile(
              leading: Icon(Icons.note_alt_rounded),
              title: Text(
                "My Notes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ALL NOTES → HOME SCREEN
            ListTile(
              selected: true,
              selectedTileColor: Colors.blue.shade100,
              leading: Icon(Icons.note),
              title: Text("All Notes"),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            // FAVOURITE → FAV SCREEN
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("Favourite Notes"),

              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => favscreen(),
                  ),
                );
              },
            ),

            // DARK MODE
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Dark Mode"),
              trailing: Switch(
                value: context.watch<modeprovider>().isdark!,
                onChanged: (value) {
                  context.read<modeprovider>().togglethem();
                },
              ),
            ),

            // SETTINGS

          ],
        ),
      ),

      // YOUR NORMAL SCREEN
      body: Builder(
        builder: (context) {
          List<note>notes=context.watch<notesprovider>().getdata();
          return Column(
            children: [

              SizedBox(height: 60),

              Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu,size: 35,),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "My Notes",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),


                  SizedBox(width: 30),

                ],
              ),

              Expanded(child: notes.isEmpty?Center(child: Text("no data added"),):Padding(
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
                              Text(notes[index].title,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:context.watch<modeprovider>().isdark! && notes[index].color==null?Colors.white:Colors.black),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(notes[index].body,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 19,color:context.watch<modeprovider>().isdark! && notes[index].color==null?Colors.white:Colors.black54),),
                              SizedBox(
                                height: 56,
                              ),
                              Text(notes[index].date!,style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ))


            ],
          );
        },
      ),
    );
  }
}