import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Seeall extends StatefulWidget {
  const Seeall({Key? key}) : super(key: key);

  @override
  _SeeallState createState() => _SeeallState();
}

class _SeeallState extends State<Seeall> {
  List<String> category_name=["Headphons","Hair care","Fashion","Accesories","Electronics","Make Up","Skin care","Toys","Furniture","Phone cases"];
  List<String> category_path=["assets/categories/0a27de78ad75b78cbbd248cf7f721d42.jpg",
    "assets/categories/6cd4ec6cb2202c6e3b4fb097756fe0e7.jpg",
    "assets/categories/fashion/7724da735c4c57d60c219d9f6cd90213.jpg",
    "assets/categories/accesories/CjQmHJGW0AIR9Kk.jpg",
    "assets/categories/676e575a7bf428667172fd3d3249bd82.jpg",
    "assets/categories/0924b160f2778323244206da6b8edcfd.jpg",
    "assets/categories/d20f8c28ce51b28ba5b314136e790c13.jpg",
    "assets/categories/e7ab510755ada3a08ec12421419d6d9b.jpg",
    "assets/categories/furniture/264625518_432033591731380_4581682119793461651_n.jpg",
    "assets/categories/fd32f6f31961a79d3f2cc95b510a2008.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 120,
        backgroundColor: Colors.deepPurple,
        title: Text('Category'),
      ),
        body:MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: category_path.length,
            itemBuilder: (context, index) {
              return Container(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child:
                        Image.asset(category_path[index],fit: BoxFit.cover,) ,
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(category_name[index],style: TextStyle(
                        color: Colors.white,
                        fontWeight:FontWeight.bold,
                        fontSize: 20
                      ),),

                    )

                  ],

                )
              );
    })
    );
  }


}

