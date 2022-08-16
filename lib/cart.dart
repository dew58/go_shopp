import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'checkout.dart';
import 'home.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFEFEFE),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF432267),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading:false,
            //toolbarHeight: 120,
            backgroundColor: Color(0xFF432267),
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton( icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () => ZoomDrawer.of(context)!.toggle()),
                Text ("Cart",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20)),
                IconButton( icon: SvgPicture.asset("assets/icons/home.svg",color: Color(0xFFFEFEFE)), onPressed: () {
                  Navigator.push(context, scaleIn(MainHome()));
                },
                ),
              ],
            ),
          ),),
          Positioned(
            left: MediaQuery.of(context).size.width*0.07,
            top: MediaQuery.of(context).size.height*0.12,
            child: Material(
            elevation: 10,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFFEFEFE)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton( icon:Icon(Icons.search,color: Color(0xFF432267),), onPressed: () {  },),
                  Expanded(child: SizedBox(
                    height: 50,
                    width:250,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Type a product name",
                        hintStyle: TextStyle(color: Color(0xFF432267)),
                        fillColor: Color(0xFFFEFEFE),
                        border: InputBorder.none,),
                    ),
                  ),),


                  IconButton( icon: SvgPicture.asset("assets/icons/Group 288.svg",), onPressed: () {  },),
                ],
              ),
            ),
          ),),
          Positioned(
            left: 20,
              top: MediaQuery.of(context).size.height*0.2,
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Product:",style: TextStyle(color: Color(0xFF9F94AB)),),
                      Text("Subtotal:",style: TextStyle(color: Color(0xFF9F94AB))),
                      Text("Taxes:",style: TextStyle(color: Color(0xFF9F94AB))),

                    ],
                  )
              )),
          Center(

            child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Center(
                        child:  Container(
                          decoration:BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFFFEFEFE),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],),
                          height: MediaQuery.of(context).size.height*0.15,
                          width: MediaQuery.of(context).size.width*0.9,
                        ),),
                      Positioned(
                        left:20,
                        child: Container(
                            height: MediaQuery.of(context).size.height*0.15,
                            width:90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                                  bottomLeft:Radius.circular(20) ),
                              child: Image.asset("assets/categories/fashion/3bd8c4cec1abb656e5320f8f1cff77eb.jpg",fit: BoxFit.fill,),
                            )),
                      ),
                      Positioned(
                        top:20,
                        left: MediaQuery.of(context).size.width*0.3,
                        child: Column(
                          mainAxisAlignment : MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment : Alignment.topLeft,
                              child:Text("Woman's White wear",style: TextStyle(fontWeight: FontWeight.bold),),),
                            Align(
                              alignment : Alignment.topLeft,
                              child:Text("American Trenda",style: TextStyle(fontWeight: FontWeight.bold),),),
                            Row(
                              children: [
                                Icon(Icons.star,color: Color(0xFFE99000),),
                                Icon(Icons.star,color: Color(0xFFE99000),),
                                Icon(Icons.star,color: Color(0xFFE99000),),
                                Icon(Icons.star,color: Color(0xFFE99000)),
                                Icon(Icons.star,color: Color(0xFFE99000)),
                                Text("+23"),

                              ],
                            ),
                          ],),),
                      Positioned(
                          bottom:0,
                          right :20,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF432267),
                              borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),
                                bottomRight: Radius.circular(20),),
                            ),
                            child: IconButton(onPressed: () {  },
                              icon: Icon(FontAwesomeIcons.solidHeart,color: Color(0xFFE99000)) ,),
                          ))
                    ],
                  )
                ],
              ); },


          ),),
          Positioned(
              bottom: 0,
              child: InkWell(
            onTap: (){
              Navigator.push(context, scaleIn(MainHome()));
            },
            child:  Container(
              height: MediaQuery.of(context).size.height*0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFF432267),
                  borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(20),topStart: Radius.circular(20))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.home,color: Color(0xFFE99000),size: 30,),
                  Container(margin: EdgeInsets.only(left: 20) ,
                      child: Text("Checkout",style: TextStyle(
                          color: Color(0xFFFEFEFE),fontSize: 20
                      ),)),],
              ),
            ),
          ))
        ],
      ),
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
