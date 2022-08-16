import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:go_shop/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wishpage extends StatelessWidget {
   Wishpage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120,
        backgroundColor: Color(0xFF432267),
        title:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton( icon: SvgPicture.asset("assets/icons/menu.svg",color: Color(0xFFFEFEFE)), onPressed: () => ZoomDrawer.of(context)!.toggle()),
              Text ("Wish List",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20)),
              IconButton( icon: SvgPicture.asset("assets/icons/home.svg",color: Color(0xFFFEFEFE)), onPressed: () {
                Navigator.push(context, scaleIn(MainHome()));
              },
              ),
            ],
          ),


      ),
      body: Consumer<Myfav>(builder: (context,fav , child){
        return ListView(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15,left: 15),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child:
                      Text("May your wishes come true ",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
                  IconButton(
                      onPressed: (){
                        fav.changview(false);
                      },
                      icon:SvgPicture.asset("assets/icons/path-8.svg",color: fav.isgrid?Color(0xFF432267):Color(0xFFE99000)),),//path8
                  IconButton(
                      onPressed: (){
                        fav.changview(true);
                      },
                      icon:SvgPicture.asset("assets/icons/path-7.svg",color: !(fav.isgrid)?Color(0xFF432267):Color(0xFFE99000)),),
                ],
              ),
            ),
            fav.isgrid?MasonryGridView.count(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2
              ,crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              itemCount: fav.nuul?(fav.favitem.length):(0),

              itemBuilder: (context, index) {
                return Container(
                      child: Stack(
                          children:[
                            Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20,),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      child:
                                      Image.asset(fav.favitem[index].path,fit: BoxFit.cover,) ,
                                    ),
                                  ),
                                  Container(
                                    height:36,
                                    width:180,
                                    decoration: BoxDecoration(
                                        boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(0,10),
                                            blurRadius: 3.0,
                                            spreadRadius: 0
                                        )
                                        ]
                                    ),
                                    margin: EdgeInsets.only(right: 10,left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            decoration: new BoxDecoration(
                                                color: Color(0xFFFEFEFE),
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: const Radius.circular(10),
                                                  bottomLeft: const Radius.circular(10),
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text("Type of Brand",style: TextStyle(color: Color(0xFF432267),fontSize: 12,fontWeight: FontWeight.bold),textAlign:TextAlign.center),
                                                Text("Brand",style: TextStyle(color: Colors.grey,fontSize: 10),textAlign:TextAlign.center,),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0xFF432267),
                                              borderRadius: const BorderRadius.only(
                                                bottomRight: const Radius.circular(10),
                                                topRight: const Radius.circular(10),
                                              )
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(FontAwesomeIcons.bagShopping,color:  Color(0xFFFEFEFE),size: 15,),

                                              Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: Text('\$ 15.99', style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color:  Color(0xFFFEFEFE)
                                                ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5,left: 5),
                              decoration: new BoxDecoration(
                                color: Color(0xFFFEFEFE),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top:5.0,bottom: 5,right: 8,left: 8),
                                child: Text('70% OFF',style: TextStyle(color:  Color(0xFFE99000),fontSize: 12),textAlign: TextAlign.center,),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.topEnd,
                              margin: EdgeInsets.only(top: 5,right: 5),
                              child: CircleAvatar(
                                  backgroundColor: fav.favitem[index].loved? Color(0xFF432267):Color(0xFFFEFEFE),
                                  child:  Consumer<Popular>(builder: (context,popular,child){
                                    return IconButton(
                                          onPressed: () {
                                            fav.removfan(index);
                                            fav.favitem[index].loved=false;
                                            popular.change(index, false);

                                        },
                                        icon:fav.favitem[index].loved == null?
                                        (Icon(FontAwesomeIcons.heart,color: Colors.deepPurple,)):
                                        (fav.favitem[index].loved?SvgPicture.asset("assets/icons/path-9.svg",color: Color(0xFFE99000)) :SvgPicture.asset("assets/icons/path.svg",color: Color(0xFF432267)))

                                    );
                                  },
                                  )
                              ),
                            )
                          ]
                      )
                );
              }
              ):
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fav.nuul?(fav.favitem.length):(0),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container( height: MediaQuery.of(context).size.height*0.17,
                      width: MediaQuery.of(context).size.width*0.9,),
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
                          child: Image.asset(fav.favitem[index].path,fit: BoxFit.fill,),
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
                      bottom: MediaQuery.of(context).size.height*0.02,
                      right :20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF432267),
                          borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),
                          bottomRight: Radius.circular(20),),
                        ),
                          child:Consumer<Popular>(builder: (context,popular,child){
                            return IconButton(onPressed: () {
                            fav.removfan(index);
                            fav.favitem[index].loved=false;
                            popular.change(index, false);
                          },
                            icon: SvgPicture.asset("assets/icons/path-9.svg",color: Color(0xFFE99000)),);//path9
                  })),


                  ),
                    Positioned(
                        bottom:0,
                        child: SizedBox(height: 20,))
                ],
              ); },


            )
          ]
        );
      }
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




class Myfav with ChangeNotifier{
  List<Item> favitem= [] ;
  bool nuul=true;
  bool isgrid =false;

  changview(bool val){
    isgrid =val;
    notifyListeners();
  }

   addtofav(String path,bool flag){
     Item item =Item(path: path, loved: flag);
     favitem.add(item);
     notifyListeners();
   }

   removfan(int index){
     favitem.removeAt(index);
     notifyListeners();
   }

}
class Item{
  late String path;
   bool loved =false ;
  Item({required this.path,required this.loved});
}

