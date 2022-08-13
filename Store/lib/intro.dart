import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:store/home_page.dart';
import 'package:store/start2.dart';
import 'package:store/start3.dart';

class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Colors.deepPurple,

      pages: [

        PageViewModel(bodyWidget: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top:50,bottom: 100),
                child: Lottie.asset("assets/anime/58915-online-shop.json")),
            Container(
              //margin: EdgeInsets.only(top: 50,right: 30,left: 30),
              child: Text("Welcome to the store here you can find all you want",
              style: TextStyle(
              color: Colors.white70,fontSize: 20,
              ),
                textAlign: TextAlign.center,
              ),
            ),
                Container(
                    margin: EdgeInsets.only(right: 20,left: 20,top: 30),
                    child: IntrinsicHeight(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    TextButton(
                    onPressed: () {
                    Navigator.push(
                    context,
                MaterialPageRoute(builder: (context) =>  home_page()),
                );
                },
        child: Text(
        "Skip",
        style: TextStyle(fontSize: 20,color: Colors.white70),
        ),
        ),
        VerticalDivider(
        thickness: .5,
        color: Colors.white70,
        ),
        TextButton(
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const start2()),
        );
        },
        child: Text(
        "Next",
        style: TextStyle(fontSize: 20,color: Colors.orange),
        ),
        ),
        ],
        )
        ),
        ),
        ],
        ),title: "",decoration: const PageDecoration(
          pageColor: Colors.deepPurple,
        ),),
        PageViewModel(bodyWidget: Column(
        children: [
          Container(
        alignment:AlignmentDirectional.topEnd,
            margin: EdgeInsets.only(left: 300,bottom: 30),
            child:  TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  home_page()),
                );
              },
              child: Text(
                "Skip",textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20,color: Colors.orange),
              ),
            ),),
          Container (
              margin: EdgeInsets.only(top: 20,bottom: 50),
              child: Lottie.asset('assets/anime/71390-shopping-cart-loader.json')),
          Container(
            //margin: EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Text("You will get all your needs with free shipping",
              style: TextStyle(
                color: Colors.white70,fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20,left: 20,top: 20),
            child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "back",
                        style: TextStyle(fontSize: 20,color: Colors.white70),
                      ),
                    ),
                    VerticalDivider(
                      thickness: .5,
                      color: Colors.white70,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const start3()),
                        );
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 20,color: Colors.orange),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),title: "",decoration: const PageDecoration(
          pageColor: Colors.deepPurple,
        ),),
        PageViewModel(bodyWidget: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 50,bottom: 90),
              child: Lottie.asset('assets/anime/85712-announcement.json')),
          Container(
           // margin: EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Text("make sure to log in to be able to look to newly offers.",
              style: TextStyle(color: Colors.white70,fontSize: 20,),
              textAlign: TextAlign.center,
            ),
          ),
           IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "back",
                        style: TextStyle(fontSize: 20,color: Colors.white70),
                      ),
                    ),
                    VerticalDivider(
                      thickness: .5,
                      color: Colors.white70,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  home_page()),
                        );
                      },
                      child: Text(
                        "Finsh",
                        style: TextStyle(fontSize: 20,color: Colors.orange),
                      ),
                    ),
                  ],
                )
            ),
        ],
      ),title: "",decoration: const PageDecoration(
          pageColor: Colors.deepPurple,
        ),)

      ]
      ,dotsDecorator:   const DotsDecorator(
      size: Size(5, 10.0), //size of dots
      color: Colors.white, //color of dots
      activeSize: Size(15, 10.0),
      activeColor: Colors.orange, //color of active dot
      activeShape: RoundedRectangleBorder( //shave of active dot
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
      onDone:() =>Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context){
            return home_page();
          }
          ), (Route<dynamic> route) => false)
          ,done: Text(''),
      skip: null,
      next: Icon(Icons.nat,color: Colors.deepPurple,),
      dotsContainerDecorator:BoxDecoration(color: Colors.deepPurple) ,
      showBackButton: false,
      showSkipButton: false,
        controlsPosition: const Position(left: 0, right: 140, bottom:2)

     );
  }
}
