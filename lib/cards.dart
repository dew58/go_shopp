import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'Models/cartmodel.dart';
import 'Models/wishlistmodel.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class cards extends StatefulWidget {
  const cards({Key? key}) : super(key: key);


  @override
  _cardsState createState() => _cardsState();
}

class _cardsState extends State<cards> {
var currentPage =0;
  @override
  Widget build(BuildContext context) {
    final wish = Provider.of<Wishmodel>(context);
    final product = Provider.of<Popular>(context);
    final cart = Provider.of<Cartmodel>(context);
    final controller = PageController(initialPage: wish.pageindex);
    var pageindex ;
    return product.loading?Center(child: CircularProgressIndicator(),): Scaffold(
      body:Stack(
        children: [
          PageView.builder(
              scrollDirection : Axis.vertical,
            controller: controller,
                    itemCount: product.product.length,
              onPageChanged: (page){
                setState(() {
                  currentPage=page;
                });
              },

              itemBuilder:(context, index){
            return Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  child: Image.network("${product.product[index].image}"),
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
                           Align(
                              child: Text("${product.product[index].title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft),
                           Align(
                              child: Text("${product.product[index].category}",style: TextStyle(fontSize: 18),textAlign: TextAlign.left,),
                              alignment: Alignment.topLeft),
                          Row(
                            children: [
                              Icon(Icons.star,color: Color(0xFFE99000),),
                              Icon(Icons.star,color: Color(0xFFE99000),),
                              Icon(Icons.star,color: Color(0xFFE99000),),
                              Icon(Icons.star,color: Color(0xFFE99000),),
                              Icon(Icons.star,color: Color(0xFFE99000),),
                              Text("+23"),

                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            child: Text("${product.product[index].description}"
                                ,style: TextStyle(fontSize: 15),textAlign: TextAlign.left),
                          ),
                          // Align(
                          //     alignment: Alignment.topLeft,
                          //     child: Text("Material & Size",style: TextStyle(fontWeight: FontWeight.bold),)),
                          //
                          // Container(
                          //   margin: EdgeInsets.only(top: 10,bottom: 10),
                          //   child: Align(
                          //     alignment: Alignment.topLeft,
                          //     child: Text("Ultra Soft Cashmere-like Acrylic , furry ,cozy ,light and warm"
                          //         ,style: TextStyle(fontSize: 15),textAlign: TextAlign.left),
                          //   ),
                          // ),


                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: MediaQuery.of(context).size.width*0.2,
                  child: InkWell(
                    onTap:(){
                      if((cart.cartintem.firstWhereOrNull((item) => item.id == product.product[index].id)==null )) {
                        cart.addtocart(product.product[index]);
                        print("added");
                      }

                    },
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Color(0xFF432267)
                      ),

                      child: Container(
                        margin: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("\$ ${product.product[index].price}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                            VerticalDivider(
                              endIndent:3,
                              indent:3,
                              thickness: 4,
                              color: Colors.white,
                            ),
                            Icon(Icons.home,color: Color(0xFFE99000),),
                            Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      )),),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height*0.45,
                    right: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF432267),
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
              child:
              IconButton(onPressed: () {   Navigator.pop(context);
              }, icon: Icon(FontAwesomeIcons.arrowLeft,color: Color(0xFF432267),),),
          ),
          Positioned(
              top:MediaQuery.of(context).size.height*0.05,
              right: 15,
              child:
              IconButton(onPressed: () {

                if((wish.loveditem.firstWhereOrNull((item) => item.id == product.product[currentPage].id)==null )) {
                wish.addtowish(product.product[currentPage]);
                print("added");
              }
              else {
                wish.removwish(product.product[currentPage].id);
                print("removed");
              }
              }, icon:!(wish.loveditem.firstWhereOrNull((item) => item.id == product.product[currentPage].id)==null )?

              SvgPicture.asset("assets/icons/loved.svg",width: 25,height: 25,)
                      :SvgPicture.asset("assets/icons/path.svg",width: 25,height: 25,),),),
          Positioned(
            top: MediaQuery.of(context).size.height*0.2,
            left: 15,
            child: SmoothPageIndicator(
              axisDirection : Axis.vertical,
              count:5 ,
              controller: controller,
            effect: const WormEffect(
                radius : 30,
                dotColor: Color(0xFFE99000),
              activeDotColor: Color(0xFF432267),
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
