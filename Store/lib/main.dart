import 'package:flutter/material.dart';
import 'package:store/intro.dart';
import 'package:store/test.dart';

import 'cards.dart';
import 'editprofile.dart';
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
      const MaterialApp(
        title: 'Flutter Demo',
        home:app_1(),
      );
  }
}
