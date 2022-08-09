import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  int applecount = 0;

  TopBar({Key? key, required this.applecount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade900,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 30, 10, 0),
        child: Row(
          children: [
          Container(child: Icon(Icons.apple,color: Colors.red,size: 30,),height: 30,width: 30,),
          SizedBox(width: 10,),
          Text(applecount.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
        ],),
      ),
    );
  }
}
