import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_shop/Models/historymodel.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class uihistory extends StatefulWidget {
  const uihistory({Key? key}) : super(key: key);

  @override
  _uihistoryState createState() => _uihistoryState();
}

class _uihistoryState extends State<uihistory> {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);
    return Scaffold(
    backgroundColor: Color(0xFFFEFEFE),
      appBar: AppBar(
        toolbarHeight:60,
        automaticallyImplyLeading:false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF432267),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             IconButton( icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () => ZoomDrawer.of(context)!.toggle()),
            Text ("Order History",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 15,fontWeight:FontWeight.w400 )),
            IconButton( icon: SvgPicture.asset("assets/icons/home.svg",color: Color(0xFFFEFEFE)), onPressed: () {
              Navigator.push(context, scaleIn(MainHome()));
            },
            ),
          ],
        ),
      ),
      body: Center(

    child: ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    itemCount: history.history.length,
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
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 7,
    offset: Offset(0, 2), // changes position of shadow
    ),
    ],),
    height: MediaQuery.of(context).size.height*0.18,
    width: MediaQuery.of(context).size.width*0.9,
    ),),
      Positioned(
        left:MediaQuery.of(context).size.width*0.05,
        child: Container(
            height: MediaQuery.of(context).size.height*0.18,
            width:MediaQuery.of(context).size.width*0.27,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),
                  bottomLeft:Radius.circular(20) ),
              child: Image.network("${history.history[index].image}",fit: BoxFit.fill,),
            )),
      ),
      Positioned(
        top:10,
        left: MediaQuery.of(context).size.width*0.35,
        child: Column(
          mainAxisAlignment : MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment : Alignment.topLeft,
              child:Text("${history.history[index].id}  \t   ${history.date}  ",style: TextStyle(fontWeight: FontWeight.w700,color: Color(0xFF9F94AB),fontSize: 10),),),
            SizedBox(height: 5,),
            Align(
              alignment : Alignment.topLeft,
              child:Text("${history.history[index].title}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 10),),),
            Padding(
              padding: const EdgeInsets.only(right: 67),
              child: Align(
                alignment : Alignment.topLeft,
                child:Text("American Trends",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 8),),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                children: [
                  Icon(Icons.star,color:  Color(0xFFE99000),size: 20,),
                  Icon(Icons.star,color:  Color(0xFFE99000),size: 20,),
                  Icon(Icons.star,color: Color(0xFFE99000),size: 20,),
                  Icon(Icons.star,color:  Color(0xFFE99000),size: 20,),
                  Icon(Icons.star_half,color:  Color(0xFFE99000),size: 20,),
                  Text("+23",style: TextStyle(fontSize: 6,fontWeight: FontWeight.w600),),

                ],
              ),
            ),
          ],),),
      Positioned(
          bottom:0,
          right :MediaQuery.of(context).size.width*0.05,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF432267),
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),
                bottomRight: Radius.circular(20),),
            ),
            child: IconButton(onPressed: () {  },
              icon: Icon(FontAwesomeIcons.shareNodes,color: Color(0xFFE99000),) ,),
          ))
     ] ),
     ]);
    })
    )
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