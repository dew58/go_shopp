import 'package:flutter/cupertino.dart';
import 'package:go_shop/productmodel.dart';

import 'cartmodel.dart';
class History with ChangeNotifier{

  List<Product> history =[];
  late DateTime date;
  late String dat;
  List<Cartvar> cart=[];

  addtohistory(List<Cartvar> list){
    for(var i=0; i< list.length;i++){
      history.addAll(list[i].product) ;
    }
    notifyListeners();
  }

  getdate(){
    DateTime now =  DateTime.now();
    date = DateTime(now.year, now.month, now.day);
    dat =date.toString() ;
    notifyListeners();
  }

}