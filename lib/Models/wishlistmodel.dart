import 'package:flutter/cupertino.dart';
import 'package:go_shop/productmodel.dart';

class Wishmodel with ChangeNotifier{
  List<Product> loveditem =[];


  addtowish(var item){
    loveditem.add(item);
    notifyListeners();
  }

  removwish(var id){
    loveditem.removeWhere((item) => item.id == id);
    notifyListeners();
  }
  var pageindex=0;
  pagenum(var index){
    pageindex = index;
  }
}