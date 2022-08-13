import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class wishpage extends StatelessWidget {
  final List<String> favoriteItems;
  const wishpage({Key? key,required this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120,
        backgroundColor: Colors.deepPurple,
        title: Text("Wish List"),

      ),
      body: Container(
        child:  MasonryGridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2
          ,crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: favoriteItems.length,

          itemBuilder: (context, index) {
            String imge = favoriteItems[index];
            bool loveflag = favoriteItems.contains(imge);
            return Container(
                child: Stack(
                    children:[
                      Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25,),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                child:
                                Image.asset(favoriteItems[index],fit: BoxFit.cover,) ,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      offset: const Offset(0,10),
                                      blurRadius: 3.0,
                                      spreadRadius: 0
                                  )
                                  ]
                              ),
                              margin: EdgeInsets.only(top: 20,right: 10,left: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: new BorderRadius.only(
                                            topLeft: const Radius.circular(15),
                                            bottomLeft: const Radius.circular(15),
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
                                          bottomRight: const Radius.circular(15),
                                          topRight: const Radius.circular(15),
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
                              if (loveflag){
                                favoriteItems.remove(favoriteItems[index]);
                                loveflag=false;
                                (context as Element).markNeedsBuild();
                              }else{
                                favoriteItems.add(favoriteItems[index]);
                                loveflag=true;
                                (context as Element).markNeedsBuild();
                              }
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

    );
  }
}

