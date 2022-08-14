import 'package:flutter/material.dart';
import 'package:store/intro.dart';
import 'package:store/test.dart';
import 'package:provider/provider.dart';
import 'package:store/wishlist.dart';
import 'cards.dart';
import 'editprofile.dart';
import 'home.dart';
import 'home_page.dart';
import 'login.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

      MultiProvider(
        providers: [
          ChangeNotifierProvider<Myfav>(create: (context) => Myfav()),
          ChangeNotifierProvider<Popular>(create: (context) => Popular()),

        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'JosefinSans',
          ),
          title: 'Flutter Demo',
          home:MainHome(),
        ),
      );

  }
}
