import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/home_page.dart';
import 'package:store/start2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
           Container(
               margin: EdgeInsets.only(top:100,bottom: 150),
               child: Lottie.asset("assets/anime/58915-online-shop.json")),
           Container(
            margin: EdgeInsets.only(top: 50,right: 30,left: 30),
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
      ),
    );
  }
}
