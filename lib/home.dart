import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_shop/cards.dart';
import 'package:go_shop/cart.dart';
import 'package:go_shop/seeall.dart';
import 'package:go_shop/wishlist.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 1;


  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Drawer(setIndex: (index) {
        setState(() {
          currentIndex = index;
        });
      },),
      mainScreen: currentScreen(),
      menuBackgroundColor: Color(0xFF432267),
      angle: 0,
      borderRadius: 30,
      showShadow: true,
      slideWidth: MediaQuery
          .of(context)
          .size
          .width * 0.65,

    )
    ;
  }

  Widget currentScreen() {
    switch (currentIndex) {
      case 1:
        return Body();
      case 2:
        return Wishpage();
      case 3:
        return Cart();
      case 4:
        return Body();
      case 5:
        return Body();
      case 6:
        return Body();
      default:
        return Body();
    }
  }
}
class Drawer extends StatefulWidget {
  final ValueSetter setIndex;
  const Drawer({Key? key, required this.setIndex}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF432267),

        body: Stack(
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 30,
              child: Column(
                children: [
                  SvgPicture.asset("assets/icons/path-11.svg",color: Color(0xFFE99000),height: 60,width: 60,),
                  Container(
                    margin: EdgeInsets.only(top: 17),
                    child: Text("Nada Mohmmed",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 18),textAlign: TextAlign.center,),),
                  Text("nada.mohamed@example.com",style: TextStyle(color: Color(0xFFE99000),fontSize: 14),textAlign: TextAlign.center,),
                ],
              ),
            ),
            Positioned(
               top: MediaQuery.of(context).size.height*0.2,
               child: Container(
                 height: MediaQuery.of(context).size.height*0.57,
                 width: MediaQuery.of(context).size.width*0.4,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(1);
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/home-1.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Home',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       )
                     ),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child:InkWell(
                         onTap: (){
                           widget.setIndex(2);
                         },
                         child:  Row(
                           children: [
                             SvgPicture.asset("assets/icons/loved.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Wishlist',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(3);
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/shopping-bag-1.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Cart',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       )),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(4);
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/path-10.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Order History',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       )),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(5);
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/path-11.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Profile',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(6);;
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/settings.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('App Setting',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),),
                     Container(
                       margin: EdgeInsets.only(left: 20, bottom: 12),
                       child: InkWell(
                         onTap: (){
                           widget.setIndex(7);
                         },
                         child: Row(
                           children: [
                             SvgPicture.asset("assets/icons/settings.svg",color: Color(0xFFE99000)),
                             SizedBox(width: 12,),
                             Text('Help & FAQs',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                           ],
                         ),
                       ),),


                ],
              ),
            )),
            Positioned(
              bottom: 30,
              child:Container(
              margin: EdgeInsets.only(left: 20, bottom: 12),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/logout.svg",color: Color(0xFFE99000)),
                  SizedBox(width: 12,),
                  Text('Logout',style: TextStyle(color: Color(0xFFFEFEFE),fontWeight: FontWeight.bold),),
                ],
              ),
            ),),
          ],

        ),
    );
  }

}


class Body extends StatelessWidget {
   Body({Key? key}) : super(key: key);

  List <String> offers =["assets/5a6561119db533beb718347ff9c8b81d.jpg",
    "assets/ab640b2dfa42adac718ab6e5f40d99.jpg",
    " assets/ab640b2dfa42adac718ab6e5f40d99c9.jpg"];

  //final GlobalKey<ScaffoldState> _key = GlobalKey();

   bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xFFFEFEFE) ,

        body:  Consumer<Popular>(builder: (context,popular,child){
          return ListView(

            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            children:<Widget> [
              Stack(
                children: [
                  AppBar(
                    elevation: 0,
                    centerTitle: true,
                    toolbarHeight: 120,
                    automaticallyImplyLeading: false,
                    backgroundColor: Color(0xFF432267),

                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton( icon: SvgPicture.asset("assets/icons/menu.svg"),
                         onPressed: () => ZoomDrawer.of(context)!.toggle()),
                          Text ("Home",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 20)),
                          IconButton( icon:SvgPicture.asset("assets/icons/shopping-bag.svg"),
                           onPressed: () {
                             Navigator.push(context, scaleIn(Cart()));
                           },),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 100,left: 20,right: 20),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Container(
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
                              child: const TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Type a product name",
                                  hintStyle: TextStyle(color: Color(0xFF432267)),
                                  fillColor: Color(0xFFFEFEFE),
                                  border: InputBorder.none,),
                              ),
                            ),),


                            IconButton( icon:SvgPicture.asset("assets/icons/Group 288.svg",color: Color(0xFF432267)),
                              onPressed: () {  },),
                          ],
                        ),
                      ),
                    ),

                  ),],),//searching
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10,top: 10),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Category",style: TextStyle(color: Color(0xFF432267),fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    TextButton( onPressed: () {
                      Navigator.push(context, scaleIn(Seeall()));
                    },
                        child: Text("See all (9)",style: TextStyle(color:Color(0xFF432267) ,fontSize: 15),))
                  ],
                ),
              ),//category text
              Padding(
                padding: const EdgeInsets.only(top: 20,right: 10,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFFEFEFE),
                        image: DecorationImage(
                            image: AssetImage("assets/categories/fashion/M24-310s.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Center(child: Text("Fashion",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 17,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6,left: 6),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFFEFEFE),
                          image: DecorationImage(
                              image: AssetImage("assets/categories/accesories/CjQmHJGW0AIR9Kk.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Center(child: Text("Accesories",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 17,fontWeight: FontWeight.bold),)),
                      ),
                    ), Container(
                      height: 120,
                      width: 120,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFFEFEFE),
                        image: DecorationImage(
                            image: AssetImage("assets/categories/furniture/264625518_432033591731380_4581682119793461651_n.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Center(child: Text("Home Office",style: TextStyle(color: Color(0xFFFEFEFE),fontSize: 17,fontWeight: FontWeight.bold),)),
                    ),
                  ],
                ),
              ),//category items
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 230,
                  width: double.infinity,
                  child: Image.asset('assets/5a6561119db533beb718347ff9c8b81d.jpg'),
                ),
              ),//offers
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Popular",style: TextStyle(color: Color(0xFF432267),fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),// popular
              Container(
                margin: EdgeInsets.all(15),
                child:InkWell(
                  onTap:  () {
                    Navigator.push(context, scaleIn(cards()));
                  },
                  child:  MasonryGridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2
                    ,crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: popular.popular.length ,
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
                                          Image.asset(popular.popular[index].path,fit: BoxFit.cover,) ,
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
                                                  SvgPicture.asset("assets/icons/shopping-bag.svg"),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10.0,top: 2),
                                                    child: Text('\$ 15.99', style: TextStyle(
                                                        fontSize: 10,
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
                                Positioned(
                                    right: 5,
                                    child: Container(
                                  height: 50,
                                  width: 50,
                                  alignment: AlignmentDirectional.topEnd,
                                  margin: EdgeInsets.only(top: 5,right: 5),
                                  child: CircleAvatar(
                                      backgroundColor:  popular.popular[index].loved? Color(0xFF432267):Color(0xFFFEFEFE),
                                      child:  Consumer<Myfav>(builder: (context,fav,child){
                                        return IconButton(
                                            onPressed: () {
                                              if (!ispressed){
                                                fav.addtofav(popular.popular[index].path, true);
                                                popular.change(index,true);
                                                ispressed=true;
                                              }
                                              else{
                                                fav.removfan(index);
                                                popular.change(index,false);
                                                ispressed=false;
                                              }
                                            },
                                            icon:popular.popular[index].loved?SvgPicture.asset("assets/icons/loved.svg",width: 25,height: 25,)
                                                :SvgPicture.asset("assets/icons/path.svg",width: 25,height: 25,)
                                        );
                                      },)

                                  ),
                                ))
                              ]
                          )
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },)
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


class Popular with ChangeNotifier{
  List<Item> popular=[
    Item(path: "assets/categories/fashion/3bd8c4cec1abb656e5320f8f1cff77eb.jpg", loved: false),
    Item(path: "assets/categories/fashion/49b883c985108407e0148b14d77be254.jpg", loved: false),
    Item(path: "assets/categories/fashion/7724da735c4c57d60c219d9f6cd90213.jpg", loved: false),
    Item(path: "assets/categories/fashion/9766d5104d82edef4e6ea4c0cf1d736d.jpg", loved: false),
    Item(path: "assets/categories/fashion/dcf670bb756cdd62cc98109eb95adb25.jpg", loved: false),
    Item(path: "assets/categories/fashion/M24-310s.jpg", loved: false),
  ];
  change(int index, bool val){
    popular[index].loved =val;
    notifyListeners();
  }


}

