import 'dart:core';


import 'package:flutter/cupertino.dart';
import 'package:go_shop/productmodel.dart';


class Cartmodel with ChangeNotifier{

  List<Cartvar> cartintem =[];

  var price  ;

  var total;

  getprice (var  index){
    price= cartintem[index].product[index].price;
    return price;
  }
  addtocart(var item){
    cartintem.add(item);
    notifyListeners();
  }

  removcart(var id){
    cartintem.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  deletall(){
    cartintem=[];
  }

  totalitem(){
    print("hi");
    int total=0;
    for(var item=0 ;item<cartintem.length ;item++){
      total= total+cartintem[item].number as int;
    }
    return total;
  }

  totalprice(){
     double price =0.0;
    for(var item=0 ;item<cartintem.length ;item++){

      price=price+cartintem[item].product[0].price;
    }
    return price;
  }
}

class Cartvar {
 
  late List<Product> product;
   num number =1  ;
  late num? id ;

  Cartvar(this.product ,this.number ,this.id);



}