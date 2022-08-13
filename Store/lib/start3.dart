import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store/home_page.dart';
class start3 extends StatefulWidget {
  const start3({Key? key}) : super(key: key);

  @override
  _start3State createState() => _start3State();
}

class _start3State extends State<start3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 100,bottom: 90),
              child: Lottie.asset('assets/anime/85712-announcement.json')),
          Container(
            margin: EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Text("make sure to log in to be able to look to newly offers.",
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
          ),
        ],
      ),

    );
  }
}
