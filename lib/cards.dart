import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_shop/productmodel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'apisetting.dart';

class cards extends StatefulWidget {
  const cards({Key? key}) : super(key: key);

  @override
  _cardsState createState() => _cardsState();
}

class _cardsState extends State<cards> {
  late Future<Product> futureAlbum;
  final controller = PageController(initialPage: 0);

  List <String> popularimge =["assets/categories/fashion/3bd8c4cec1abb656e5320f8f1cff77eb.jpg",
    "assets/categories/fashion/49b883c985108407e0148b14d77be254.jpg",
    "assets/categories/fashion/7724da735c4c57d60c219d9f6cd90213.jpg",
    "assets/categories/fashion/9766d5104d82edef4e6ea4c0cf1d736d.jpg",
    "assets/categories/fashion/dcf670bb756cdd62cc98109eb95adb25.jpg",
    "assets/categories/fashion/M24-310s.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          PageView.builder(
              scrollDirection : Axis.vertical,
            controller: controller,
              itemCount: popularimge.length,

              itemBuilder:(context, index){
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Image.asset(popularimge[index]),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.5,
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width:MediaQuery.of(context).size.width ,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                        color: Colors.white
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 20,right: 30,left: 30),
                      child: Column(
                        children: [
                          const Align(
                              child: Text("Woman's White wear",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft),
                          const Align(
                              child: Text("American Trenda",style: TextStyle(fontSize: 18),textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Text("+23"),

                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            child: Text("Made of a featherweight version of our supersoft Lightspun double-layered cotton gauze, this cropped camp shirt has long ties in front that can be knotted closed or left undone. Layer it over a bikini as a cover-up or wear it as a set with the matching shorts."
                                ,style: TextStyle(fontSize: 15),textAlign: TextAlign.left),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Material & Size",style: TextStyle(fontWeight: FontWeight.bold),)),

                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Ultra Soft Cashmere-like Acrylic , furry ,cozy ,light and warm"
                                  ,style: TextStyle(fontSize: 15),textAlign: TextAlign.left),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width*0.2,
                  child: Container(
                      height: 60,
                      width: 250,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.deepPurple
                      ),

                      child: Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("\$ 15.99",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                            VerticalDivider(
                              endIndent:3,
                              indent:3,
                              thickness: 4,
                              color: Colors.white,
                            ),
                            Icon(Icons.home,color: Colors.orange,),
                            Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height*0.45,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Container(
                          margin: EdgeInsets.only(top: 5,bottom: 5,right: 10,left: 10),
                          child: Text("15 % OFF",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    )),


              ],
            );
          }),
          Positioned(
              top:MediaQuery.of(context).size.height*0.05,
              left: 15,
              child: Icon(FontAwesomeIcons.arrowLeft,color: Colors.deepPurple,)),
          Positioned(
              top:MediaQuery.of(context).size.height*0.05,
              right: 15,
              child: Icon(FontAwesomeIcons.heart,color: Colors.deepPurple,)),
          Positioned(
            top: MediaQuery.of(context).size.height*0.2,
            left: 15,
            child: SmoothPageIndicator(
              axisDirection : Axis.vertical,
              count:6 ,
              controller: controller,
            effect: WormEffect(
                radius : 30,
                dotColor: Colors.deepOrangeAccent,
              activeDotColor: Colors.deepPurple,
              spacing: 5,
              dotHeight: 10,
              dotWidth: 10,

            ),),
          ),
        ],
      )
    
    );

  }
  
}
