
import 'package:flutter/material.dart';

Widget defaultTextFiled({
  required TextEditingController controlller,
  required String lable,
  bool isPassword = false,
  required validate,
  IconData? suffix,
  Function? onPressed,

}) => TextFormField(
  controller: controlller,
  obscureText: isPassword,
  validator: validate,
  style: TextStyle(
    color: Color(0xFFE99000),
    // fontSize: 12.0,
    fontWeight: FontWeight.bold,
  ),
  decoration: InputDecoration(
    labelText: lable,
      // enabledBorder: InputBorder(
      //   borderSide: BorderSide(
      //     color: HexColor('#FEFEFE'),
      //   ),
      // ),
      contentPadding: const EdgeInsets.only(top: 1),
    suffixIcon: suffix != null? IconButton(
      onPressed: (){
        onPressed!();
      },
      icon: Icon(
        suffix,
        color: Color(0xFF9F94AB),
      ),
    ) : null,
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);


Widget defaultTextButton({
  required Function onPressed,
  required String text,
  Color textColor = Colors.white,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 14.0,
}) => TextButton(
  onPressed: (){
    onPressed();
  },
  child: Text(
    text,
    style: TextStyle(
      color: textColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  ),
);


void navigateTo(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}


void navigateAndFinish(context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false,
  );
}