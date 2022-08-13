import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store/cards.dart';
import 'package:store/seeall.dart';
import 'package:store/wishlist.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List <String> popularimge =["assets/categories/fashion/3bd8c4cec1abb656e5320f8f1cff77eb.jpg",
 "assets/categories/fashion/49b883c985108407e0148b14d77be254.jpg",
  "assets/categories/fashion/7724da735c4c57d60c219d9f6cd90213.jpg",
  "assets/categories/fashion/9766d5104d82edef4e6ea4c0cf1d736d.jpg",
  "assets/categories/fashion/dcf670bb756cdd62cc98109eb95adb25.jpg",
  "assets/categories/fashion/M24-310s.jpg"];

  List <String> offers =["assets/5a6561119db533beb718347ff9c8b81d.jpg",
    "assets/ab640b2dfa42adac718ab6e5f40d99.jpg",
   " assets/ab640b2dfa42adac718ab6e5f40d99c9.jpg"];

  List<String> lovelist = <String>[];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
         backgroundColor: Colors.deepPurple,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(FontAwesomeIcons.solidCircleUser,color: Colors.yellow,size:70,),
                  ),
                  Text("Nada Mohmmed",style: TextStyle(color: Colors.white70,fontSize: 20),textAlign: TextAlign.center,),
                  Text("nada.mohammed@example.com",style: TextStyle(color: Colors.yellow),),
                ],
              )

              ),
              ListTile(
              leading: Icon(FontAwesomeIcons.house,color: Colors.yellow,),
              title: Text('Home',style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.pop(context);
            }
            ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.solidHeart,color: Colors.yellow,),
                  title: Text('Wishlist',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  wishpage(favoriteItems: lovelist)),
                    );

                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.bagShopping,color: Colors.yellow,),
                  title: Text('Cart',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.clipboard,color: Colors.yellow,),
                  title: Text('Order History',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.solidCircleUser,color: Colors.yellow,),
                  title: Text('Profile',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.gear,color: Colors.yellow,),
                  title: Text('App Setting',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.solidCircleQuestion,color: Colors.yellow,),
                  title: Text('Help &FAQs',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.pop(context);
                  }
              ),
              Container(
                alignment: AlignmentDirectional.bottomEnd,
                margin: EdgeInsets.only(top:150),
                child: ListTile(
                    leading: Icon(FontAwesomeIcons.doorOpen,color: Colors.yellow,),
                    title: Text('Logout',style: TextStyle(color: Colors.white)),
                    onTap: (){
                      Navigator.pop(context);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      body:
      ListView(

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
                    backgroundColor: Colors.deepPurple,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton( icon: Icon(FontAwesomeIcons.barsStaggered,color: Colors.white), onPressed: () => _key.currentState!.openDrawer(),),
                          Text ("Home",style: TextStyle(color: Colors.white,fontSize: 20)),
                          IconButton( icon: Icon(FontAwesomeIcons.bagShopping,color: Colors.white,), onPressed: () {  },),
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
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton( icon:Icon(Icons.search,color: Colors.deepPurple,), onPressed: () {  },),
                            Expanded(child: SizedBox(
                              height: 50,
                              width:250,
                              child: const TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Type a product name",
                                  hintStyle: TextStyle(color: Colors.deepPurple),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,),
                              ),
                            ),),


                            IconButton( icon: const Icon(FontAwesomeIcons.sliders,color: Colors.deepPurple,), onPressed: () {  },),
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
                    Text("Category",style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    TextButton( onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Seeall()),
                      );

                    },
                        child: Text("See all (9)",style: TextStyle(color:Colors.purple ,fontSize: 15),))
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
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/categories/fashion/M24-310s.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Center(child: Text("Fashion",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6,left: 6),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("assets/categories/accesories/CjQmHJGW0AIR9Kk.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Center(child: Text("Accesories",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
                      ),
                    ), Container(
                      height: 120,
                      width: 120,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("assets/categories/furniture/264625518_432033591731380_4581682119793461651_n.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: Center(child: Text("Home Office",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
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
                child: Text("Popular",style: TextStyle(color: Colors.deepPurple,fontSize: 25,fontWeight: FontWeight.bold),
                ),
              ),// popular
          Container(
            margin: EdgeInsets.all(15),
            child:InkWell(
                          onTap:  () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  cards()),
                );

                },
              child:  MasonryGridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2
                ,crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: popularimge.length,
                itemBuilder: (context, index) {
                  String imge = popularimge[index];
                  bool loveflag = lovelist.contains(imge);
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
                                      Image.asset(popularimge[index],fit: BoxFit.cover,) ,
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
                                                color:Colors.white,
                                                borderRadius: new BorderRadius.only(
                                                  topLeft: const Radius.circular(10),
                                                  bottomLeft: const Radius.circular(10),
                                                )
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text("Type of Brand",style: TextStyle(color: Colors.deepPurple,fontSize: 12,fontWeight: FontWeight.bold),textAlign:TextAlign.center),
                                                Text("Brand",style: TextStyle(color: Colors.grey,fontSize: 10),textAlign:TextAlign.center,),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: new BoxDecoration(
                                              color: Colors.deepPurple,
                                              borderRadius: new BorderRadius.only(
                                                bottomRight: const Radius.circular(10),
                                                topRight: const Radius.circular(10),
                                              )
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(FontAwesomeIcons.bagShopping,color: Colors.white,size: 15,),

                                              Padding(
                                                padding: const EdgeInsets.only(right: 8.0),
                                                child: Text('\$ 15.99', style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white
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
                                color:Colors.white,
                                borderRadius: new BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top:5.0,bottom: 5,right: 8,left: 8),
                                child: Text('70% OFF',style: TextStyle(color: Colors.orange,fontSize: 12),textAlign: TextAlign.center,),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.topEnd,
                              margin: EdgeInsets.only(top: 5,right: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(onPressed: () {
                                  setState(() {
                                    if (loveflag){
                                      lovelist.remove(popularimge[index]);
                                      loveflag=false;
                                    }else{
                                      lovelist.add(popularimge[index]);
                                      loveflag=true;
                                    }
                                  }
                                  );
                                },
                                  icon: loveflag?Icon(FontAwesomeIcons.solidHeart,color: Colors.deepPurple,) :Icon(FontAwesomeIcons.heart,color: Colors.deepPurple,),
                                ),
                              ),
                            )
                          ]
                      )
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
