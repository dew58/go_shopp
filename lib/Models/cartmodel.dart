import 'package:flutter/cupertino.dart';
import 'package:go_shop/productmodel.dart';

class Cartmodel with ChangeNotifier{

  List<Product> cartintem =[];
  addtocart(var item){
    cartintem.add(item);
    notifyListeners();
  }

  removcart(var id){
    cartintem.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}