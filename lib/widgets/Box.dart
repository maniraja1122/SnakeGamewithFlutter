import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
class Box extends StatelessWidget {
  int r=0;
  int c=0;
  int randx=0;
  int randy=0;
  var snakearrx=[];
  var snakearry=[];
  String GenerateChunks(int first,int second){
    var firstChunk = utf8.encode(first.toString());
    var secondChunk = utf8.encode(second.toString());

    var output = AccumulatorSink<Digest>();
    var input = sha1.startChunkedConversion(output);
    input.add(firstChunk);
    input.add(secondChunk); // call `add` for every chunk of input data
    input.close();
    var digest = output.events.single;
    return digest.toString();
  }
  Box({Key? key,required this.r,required this.c,required this.snakearrx,required this.snakearry,required this.randx,required this.randy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var asciipos=[for(int i=0;i<snakearrx.length;i++) GenerateChunks(snakearrx[i], snakearry[i])];
   if(snakearrx.contains(c) && snakearry.contains(r) &&  asciipos.contains(GenerateChunks(c, r))){
      return Container(height: 20, width: 20, color: Colors.blue.shade700,);
    }
    else if((r*15+c)%2==0) {
      return Container(height: 20, width: 20, color: Colors.green.shade300,child: randx==c && randy==r?Icon(Icons.apple,color: Colors.red,size: 20,):SizedBox(),);
    }
    else{
      return Container(height: 20, width: 20, color: Colors.greenAccent,child: randx==c && randy==r?Icon(Icons.apple,color: Colors.red,size: 20,):SizedBox(),);
    }
  }
}
