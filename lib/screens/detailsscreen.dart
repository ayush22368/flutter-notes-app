import 'package:flutter/material.dart';
import 'package:notesappadvancedversion/model/model.dart';
import 'package:notesappadvancedversion/model/providermodel.dart';
import 'package:notesappadvancedversion/screens/editscreen.dart';
import 'package:provider/provider.dart';

class detailscreen extends StatefulWidget {
  note n;
  detailscreen({super.key,required this.n});

  @override
  State<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends State<detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.n.color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_back,size: 35,)),
                SizedBox(
                  width: 150,
                ),
                IconButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>editscreen(n: widget.n,)));
                }, icon:Icon(Icons.edit,size: 32,)),
                IconButton(onPressed: (){
                  context.read<notesprovider>().updatefavourat(widget.n);
                  setState(() {

                  });
                }, icon:Icon(Icons.favorite,color: widget.n.isfav?Colors.red:Colors.grey,size: 32,)),
                IconButton(onPressed: (){
                  context.read<notesprovider>().delete(widget.n);
                  Navigator.pop(context);
                }, icon:Icon(Icons.delete_outline_outlined,size: 32,))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(padding: EdgeInsets.only(left: 30), child: Text(widget.n.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            SizedBox(
              height: 8,
            ),
            Padding(padding: EdgeInsets.only(left: 30), child: Text(widget.n.date!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),)),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 23,
            ),

            Padding(padding: EdgeInsets.only(left: 30), child: Text(widget.n.body,style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}
