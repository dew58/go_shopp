import 'package:flutter/material.dart';
import 'package:go_shop/Models/cartmodel.dart';
import 'package:go_shop/Models/historymodel.dart';
import 'Models/wishlistmodel.dart';
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

  //
  // late List<Product> product =[];
  //
  // getproduct()async{
  //   product = await fetchProduct() ;
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     setState(() {
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {


    return  MultiProvider(
        providers: [
          ChangeNotifierProvider<Wishmodel>(create: (context) => Wishmodel()),
          ChangeNotifierProvider<History>(create: (context) => History()),
          ChangeNotifierProvider<Cartmodel>(create: (context) => Cartmodel()),
          ChangeNotifierProvider<Popular>(create: (context) => Popular()),
        ],
        child:MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'JosefinSans',
            ),
            home: MainHome()

        )
    );
  }
}


