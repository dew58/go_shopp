import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class animation2 extends StatefulWidget {
  const animation2({Key? key}) : super(key: key);

  @override
  _animation2State createState() => _animation2State();
}

class _animation2State extends State<animation2> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> image;
  late Animation<Offset> textimage;
  late Animation<Offset> text;

  @override

  void initState() {
    // TODO: implement initState
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 3),lowerBound: 0.0,
      upperBound: 1.0,)..forward();
    image = Tween<Offset>(
      begin: Offset(-2,0) , end: Offset.zero
    ) .animate(animationController);

    textimage = Tween<Offset>(
        begin: Offset(-3.5,0) , end: Offset.zero
    ) .animate(animationController);

    text = Tween<Offset>(
        begin: Offset(-4,0) , end: Offset.zero
    ) .animate(animationController);

    animationController.addListener((){
      setState(() {});
    });

    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text("animation",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body:
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    child: SlideTransition(
                      position: image,
                      child: Image.asset("assets/categories/676e575a7bf428667172fd3d3249bd82.jpg",fit: BoxFit.fill,),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child:
                    SlideTransition(
                      position: textimage,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                          ),

                          child: Center(
                            child: const Text("text text text text text text text text text text",textAlign: TextAlign.center,
                              style:
                        TextStyle(color: Colors.white,fontSize: 35),),
                          ),
                    ),

                    ),
                  ),
                ],),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: SlideTransition(
                    position: text,
                    child: Text("Text Text Text Text Text Text Text Text Text Text Text Text vvText Text ",style: TextStyle(
                      fontSize: 20
                    ),)),
              )
            ],
          ),





    );
  }
}
