import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/model.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:notesappadvancedversion/screens/homescreen.dart';
import 'package:provider/provider.dart';

class editscreen extends StatefulWidget {
  note n;

  editscreen({super.key,required this.n});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
  List<int>colourlist=[
    0xFFFFF0A6,
    0xFFFED4DE,
    0xFFE1D3FE,
    0xFFCBF4D6,
    0xFFC1E6FE,
    0xFFFDD9B0,
  ];
  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();
  int?selectedindex;
  @override
  void initState() {
    title.text=widget.n.title;
    body.text=widget.n.body;
    var value=widget.n.color?.toARGB32();
    for(int i=0;i<colourlist.length;i++){
      if(colourlist[i]==value){
        setState(() {
          selectedindex=i;
        });
      }
    }
    super.initState();
  }
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
                  }, icon: Icon(Icons.arrow_back,size: 30,)),
                  Text("Edit Note",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  IconButton(onPressed: (){
        
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
                    context.read<notesprovider>().update(widget.n,title.text, body.text,selectedindex==null?null:Color(colourlist[selectedindex!]));
                    title.text="";
                    body.text="";
                    selectedindex=null;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
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
