import 'package:flutter/cupertino.dart';
import 'package:go_shop/productmodel.dart';
class History with ChangeNotifier{

  List<Product> history =[];
  late DateTime date;

  addtohistory(var item){
    history.add(item);
    notifyListeners();
  }

  getdate(){
    DateTime now = new DateTime.now();
    date = new DateTime(now.year, now.month, now.day);
    notifyListeners();
  }

}