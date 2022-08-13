import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class animation1 extends StatefulWidget {
  const animation1({Key? key}) : super(key: key);

  @override
  _animation1State createState() => _animation1State();
}

class _animation1State extends State<animation1> with SingleTickerProviderStateMixin {
  late Animation sizeAnimation;
  late Animation positionAnimation;
  late AnimationController animationController;
  @override
  void initState(){
    //TODO: implement initState
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    sizeAnimation = Tween<double>(begin: 30,end: 200).animate(animationController);
    positionAnimation =Tween<double>(begin: 30,end: 300).animate(animationController);
   animationController.addListener(() {
     setState(() {
       
     });
   });
    animationController.repeat();

  super.initState();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: AlignmentDirectional.topCenter,
          child: Container(
              margin: EdgeInsets.only(top:positionAnimation.value,),
              child: Icon(FontAwesomeIcons.solidCircleCheck,color: Colors.yellow,size: sizeAnimation.value,)),

      )
    );
  }
}
