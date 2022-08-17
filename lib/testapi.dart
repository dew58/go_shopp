

import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:go_shop/productmodel.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'apisetting.dart';

class UserUi extends StatefulWidget {
  const UserUi({Key? key}) : super(key: key);


  @override
  _UserUiState createState() => _UserUiState();
}

class _UserUiState extends State<UserUi> {
   late List<Product> product =[];

   getproduct()async{
     product = await fetchProduct() ;
     Future.delayed(const Duration(seconds: 1)).then((value) {
       setState ((){});
     });
   }

   @override void initState() {
    getproduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Users"),
            Text("NewUser")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child:Icon(Icons.add) ,
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
        return product==null || product.isEmpty?Center(child: CircularProgressIndicator(),):Center(
          child: Container
            (child: Text
            (""),),);
      }),
    )
    ;

  }
}
