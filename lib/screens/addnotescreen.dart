import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/model.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:provider/provider.dart';

class addnotes extends StatefulWidget {
  const addnotes({super.key});

  @override
  State<addnotes> createState() => _addnotesState();
}

class _addnotesState extends State<addnotes> {
  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();
  List<int>colourlist=[
    0xFFFFF0A6,
    0xFFFED4DE,
    0xFFE1D3FE,
    0xFFCBF4D6,
    0xFFC1E6FE,
    0xFFFDD9B0,
  ];
  int?selectedindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,size: 30,)),
                  Text("Add Note",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  IconButton(onPressed: (){
                     List<String>monts=[
                       "jan",
                       "feb",
                       "march",
                       "april",
                       "may",
                       "june",
                       "july",
                       "aug",
                       "sep",
                       "oct",
                       "nov",
                       "dec"
                     ];
                     DateTime date=DateTime.now();
                     if(title.text.isEmpty || body.text.isEmpty){
                       showDialog(context: context, builder:(context){
                         return AlertDialog(
                           title: Text("enter all details"),
                           actions: [
                             ElevatedButton(onPressed: (){
                               Navigator.pop(context);
                             }, child: Text("ok"))
                           ],
                         );
                       });
                       return;
                     }
                     var year="${date.day} ${monts[date.month-1]} ${date.year} ";
                     context.read<notesprovider>().add_data(note(title: title.text, body: body.text, isfav: false,color:selectedindex==null?null:Color(colourlist[selectedindex!]),date:year));
                     title.text="";
                     body.text="";
                     selectedindex=null;
                     Navigator.pop(context);
                  }, icon: Icon(Icons.check,size: 30,))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Title",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                  TextField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: "Enter title",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        ),
        
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height:300,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Discription",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                  TextField(
                    controller: body,
                    decoration: InputDecoration(
                      hintText: "Enter Description",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
        
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Choose Colour",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[0]),
        
                      ),
                      child: Center(child: selectedindex==0?Icon(Icons.check):null),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=1;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[1]),
        
                      ),
                      child: Center(child: selectedindex==1?Icon(Icons.check):null),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=2;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[2]),
        
                      ),
                      child: Center(child: selectedindex==2?Icon(Icons.check):null),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=3;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[3]),
        
                      ),
                      child: Center(child: selectedindex==3?Icon(Icons.check):null),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=4;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[4]),
        
                      ),
                      child: Center(child: selectedindex==4?Icon(Icons.check):null),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedindex=5;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
        
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(colourlist[5]),
        
                      ),
                      child: Center(child: selectedindex==5?Icon(Icons.check):null),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
