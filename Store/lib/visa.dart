import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class visa extends StatefulWidget {
  const visa({Key? key}) : super(key: key);

  @override
  _visaState createState() => _visaState();
}

class _visaState extends State<visa> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;
  late AnimationStatus animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    animationController=AnimationController(vsync: this ,duration: Duration(seconds: 1));
    animation =Tween(begin: 0.0 ,end: 1.0).animate(animationController);
    animationController .addListener(() {
      setState(() {

      });
    });
    animationController .addStatusListener((status) {
      animationStatus =status;
    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()..setEntry(3, 2, 0.002)..rotateX(pi * animation.value)

            ,child: InkWell(onTap: () {
              if (animationStatus == AnimationStatus.dismissed) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
              },
          child: animation.value <= 0.5 ?
          Container(
              width: 400,
              height: 200,
              child: Image.asset("assets/visa1.png")
                  ) :
          Container(
            width: 400,
            height: 200,
            child: Image.asset("assets/visa2.png")
          ),

        ),
        )
      ),
    );
  }
}
