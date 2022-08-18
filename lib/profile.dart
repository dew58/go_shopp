import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_shop/ui%20history.dart';
import 'package:go_shop/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';
import 'editcard.dart';
import 'editprofile.dart';
import 'home.dart';



class profi extends StatefulWidget {
  const profi({Key? key}) : super(key: key);

  @override
  State<profi> createState() => _profiState();
}

class _profiState extends State<profi> {
  SharedPreferences? pref2 ;

  String email ="";


  setemail(String ema)async{
    pref2= await SharedPreferences.getInstance();
    pref2!.setString("email", ema);

  }
  getdata()async{
    pref2= await SharedPreferences.getInstance();

    setState(() {
      email=pref2!.getString("email")?? "";
    });

  }


  @override
  Widget build(BuildContext context) {
    getdata();
    return Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
    appBar:
    AppBar(
      elevation: 0,

    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF432267),
      title: Padding(
        padding: const EdgeInsets.all(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton( icon: SvgPicture.asset("assets/icons/menu.svg"),
                onPressed: () => ZoomDrawer.of(context)!.toggle()),
            Text ("profile",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20,fontWeight:FontWeight.w400)),
            IconButton( icon: SvgPicture.asset("assets/icons/home.svg",color: Color(0xFFFEFEFE)), onPressed: () {
              Navigator.push(context, scaleIn(MainHome()));
            },
            ),
          ],
        ),
      ),
    ),
body: Stack(
  children: [
    Positioned(
      child:  Container(
        height:MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width ,
decoration:BoxDecoration(
    color: Color(0xFF432267),
    ))),
    Positioned(
      left:100,
      right:100 ,
      child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
    child: Icon(FontAwesomeIcons.solidUser,color: Color(0xFF432267),size: 40,)
        ),
      ),
   SizedBox(height: 5,),
    Positioned(
      left:50,right:50,top: MediaQuery.of(context).size.height*0.13,
      child: Container(

  child:Column(
   children: [
   Text("Ahmed Hossam",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFFEFEFE)),),
     SizedBox(height:2 ,),
     Text("${email}",style: TextStyle(color:  Color(0xFFE99000)),),
],
  ),
),
    ),
    Positioned(
        top:MediaQuery.of(context).size.height*0.2,
        child: Container(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFFEFEFE),
    )),
    Positioned(
        top: MediaQuery.of(context).size.height*0.06,
        child: Column(
        children: [
            InkWell(
              onTap: (){
                Navigator.push(context, scaleIn(editprofile()));
              },
              child: Container(
              margin: EdgeInsets.only(top: 160,right: 30,left: 30),
              decoration: BoxDecoration(
                borderRadius:BorderRadiusDirectional.all(Radius.circular(10)),
                color: Color(0xFF432267),
              ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                children: [
                  SizedBox(width: 9,),
                  SvgPicture.asset("assets/icons/edit.svg",color: Color(0xFFE99000)),
                  SizedBox(width: 15,),
                  Text("Edit Profile",style:TextStyle(fontSize:15,color: Color(0xFFFEFEFE),fontWeight: FontWeight.w400),)
                ],
              ),
            ),),
            InkWell(
              onTap: (){
                Navigator.push(context, scaleIn(Cart()));
              },
              child: Container(
              margin: EdgeInsets.only(top:15 ,right: 30,left: 30),
              decoration: BoxDecoration(
                borderRadius:BorderRadiusDirectional.all(Radius.circular(10)),
                color: Color(0xFF432267),
              ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                children: [
                  SizedBox(width: 9,),
                  SvgPicture.asset("assets/icons/shopping-bag-1.svg",color: Color(0xFFE99000)),
                  SizedBox(width: 15,),
                  Text("Cart",style:TextStyle(fontSize:15,color: Color(0xFFFEFEFE),fontWeight: FontWeight.w400),)
                ],
              ),
            ),),
            InkWell(
              onTap: (){
                Navigator.push(context, scaleIn(Wishpage()));
              },
              child: Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              decoration: BoxDecoration(
                borderRadius:BorderRadiusDirectional.all(Radius.circular(10)),
                color: Color(0xFF432267),
              ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                children: [
                  SizedBox(width: 9,),
                  Icon(FontAwesomeIcons.solidHeart,color: Color(0xFFE99000),size: 25,),
                  SizedBox(width: 15,),
                  Text("Wishlist",style:TextStyle(fontSize:15,color: Color(0xFFFEFEFE),fontWeight: FontWeight.w400),)
                ],
              ),
            ),),
            InkWell(
              onTap: (){
                Navigator.push(context, scaleIn(uihistory()));
              },
              child: Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              decoration: BoxDecoration(
                borderRadius:BorderRadiusDirectional.all(Radius.circular(10)),
                color:Color(0xFF432267),
              ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                children: [
                  SizedBox(width: 9,),
                  SvgPicture.asset("assets/icons/path-10.svg",color: Color(0xFFE99000)),
                  SizedBox(width: 15,),
                  Text("Order History",style:TextStyle(fontSize:15,color: Color(0xFFFEFEFE),fontWeight: FontWeight.w400),)
                ],
              ),
            ),),
            InkWell(
              onTap: (){
                Navigator.push(context, scaleIn(EditCard()));
              },
              child: Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              decoration: BoxDecoration(
                borderRadius:BorderRadiusDirectional.all(Radius.circular(10)),
                color: Color(0xFF432267),
              ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.8,
              child: Row(
                children: [
                  SizedBox(width: 9,),
                  SvgPicture.asset("assets/icons/Icon_Credit Card.svg",color: Color(0xFFE99000)),
                  SizedBox(width: 15,),
                  Text("Cards",style:TextStyle(fontSize:15,color: Color(0xFFFEFEFE),fontWeight: FontWeight.w400),)
                ],
              ),
            ),),
        ]))
      ])
    );
  }

  Route scaleIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: page,
        );
      },
    );
  }
}
