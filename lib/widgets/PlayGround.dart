import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snakegame/HomeController.dart';
import 'package:snakegame/widgets/Box.dart';


class PlayGround extends GetView {
  var snakearry=[];
  var snakearrx=[];
  PlayGround({Key? key,required this.snakearry,required this.snakearrx}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _controller=Get.find<HomeController>();
    return Container(
      height: 300,
      width: 300,
    child: Column(
      children: [
        for(int r=0;r<15;r++) Row(
          children: [
            for(int c=0;c<15;c++) Obx(() => Box(randx:_controller.randx.value ,randy:_controller.randy.value,r: r, c: c, snakearry:snakearry , snakearrx:snakearrx,))
          ],
        )
      ],
    )
    );
  }
}
