import 'dart:math';

import 'package:get/get.dart';
import 'dart:developer' as dev;

class HomeController extends GetxController{
  var applecount=0.obs;
  var snakearrx=[4,3,2,1,0].obs;
  var snakearry=[0,0,0,0,0].obs;
  var direction=3;//1-left,2-up,3-right,4-down
  var randx=7.obs;
  var randy=7.obs;
  var lastx=0;
  var lasty=0;
  var playing=false.obs;
  void SetNewDirection(int newpos){
    if((newpos-direction).abs()!=2){
      direction=newpos;
    }
  }
  //Move Snake
  Future<void> MoveSnake() async{
    while(true){
      switch(direction){
        case 1:
          lastx=snakearrx[snakearrx.length-1];
          lasty=snakearry[snakearry.length-1];
          for(int i=snakearrx.length-1;i>0;i--){
            snakearrx[i]=snakearrx[i-1];
            snakearry[i]=snakearry[i-1];
          }
          snakearrx[0]--;
          CheckCollision();
          break;
        case 2:
          lastx=snakearrx[snakearrx.length-1];
          lasty=snakearry[snakearry.length-1];
          for(int i=snakearrx.length-1;i>0;i--){
            snakearrx[i]=snakearrx[i-1];
            snakearry[i]=snakearry[i-1];
          }
          snakearry[0]--;
          CheckCollision();
          break;
        case 3:
          lastx=snakearrx[snakearrx.length-1];
          lasty=snakearry[snakearry.length-1];
          for(int i=snakearrx.length-1;i>0;i--){
            snakearrx[i]=snakearrx[i-1];
            snakearry[i]=snakearry[i-1];
          }
          snakearrx[0]++;
          CheckCollision();
          break;
        case 4:
          lastx=snakearrx[snakearrx.length-1];
          lasty=snakearry[snakearry.length-1];
          for(int i=snakearrx.length-1;i>0;i--){
            snakearrx[i]=snakearrx[i-1];
            snakearry[i]=snakearry[i-1];
          }
          snakearry[0]++;
          CheckCollision();
          break;
      }
      await Future.delayed(Duration(milliseconds: 200));
    }
  }
  void CheckCollision(){
    if(snakearrx[0]==randx.value && snakearry[0]==randy.value){
      applecount.value++;
      snakearrx.value.add(lastx);
      snakearry.value.add(lasty);
      //Set fruit new place
      do{
        randx.value=Random().nextInt(14);
        randy.value=Random().nextInt(14);
      }while(snakearrx.contains(randx.value) && snakearry.contains(randy.value));
    }
  }
}