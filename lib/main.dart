import 'package:flutter/material.dart';
import 'package:go_shop/productmodel.dart';
import 'package:go_shop/testapi.dart';
import 'package:go_shop/wishlist.dart';
import 'package:provider/provider.dart';
import 'apisetting.dart';
import 'home.dart';
import 'on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  bool? logged ;
  SharedPreferences? pref ;

  getdata()async{
    pref= await SharedPreferences.getInstance();
    setState(() {
      logged =pref!.getBool("login")?? false;
    }
    );
  }

  homee(){
    switch(logged){
      case true :
        {
          return MainHome();
        }
      case false:
        {
          return OnBoardingScreen2();
        }
      default:{
        return ;
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return  MultiProvider(
        providers: [
          ChangeNotifierProvider<Myfav>(create: (context) => Myfav()),
          ChangeNotifierProvider<Popular>(create: (context) => Popular()),
        ],
        child:MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'JosefinSans',
            ),
            home: homee()


        )
    );
  }
}


