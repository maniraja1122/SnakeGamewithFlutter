import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snakegame/HomeController.dart';
import 'package:snakegame/widgets/PlayGround.dart';
import 'package:snakegame/widgets/TopBar.dart';

class HomeView extends GetView {
  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Obx(() => _controller.playing.value?Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => TopBar(applecount: _controller.applecount.value),),
          SizedBox(
            height: 50,
          ),
          Obx(() => PlayGround(snakearry: _controller.snakearry.value, snakearrx: _controller.snakearrx.value)),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _controller.SetNewDirection(2);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_circle_up,
                size: 60,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    _controller.SetNewDirection(1);
                  }, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_circle_left_outlined, size: 60,color: Colors.white,),
              )),
              SizedBox(
                width: 70,
              ),
              InkWell(
                  onTap: () {
                    _controller.SetNewDirection(3);
                  }, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_circle_right_outlined, size: 60,color: Colors.white,),
              ))
            ],
          ),
          InkWell(
              onTap: () {
                _controller.SetNewDirection(4);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_circle_down_outlined, size: 60,color: Colors.white,),
              ))
        ],
      ):Center(child: ElevatedButton(child: Text("Play"),onPressed:() async {
        _controller.playing.value=true;
        await _controller.MoveSnake();
      } ,),))
    );
  }
}
