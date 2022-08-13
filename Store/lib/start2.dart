import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/start3.dart';

import 'home_page.dart';

class start2 extends StatefulWidget {
  const start2({Key? key}) : super(key: key);

  @override
  _start2State createState() => _start2State();
}

class _start2State extends State<start2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 300,top: 20),
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
          Container(
            margin: EdgeInsets.only(top: 80,bottom: 60),
              child: Lottie.asset('assets/anime/71390-shopping-cart-loader.json')),
          Container(
            margin: EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Text("You will get all your needs with free shipping",
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
      ),

    );
  }
}
