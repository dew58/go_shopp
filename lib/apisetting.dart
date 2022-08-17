
import 'package:go_shop/productmodel.dart';
import 'package:http/http.dart' as http;



  Future<List<Product>> fetchProduct() async{
    var result =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));
     if(result.statusCode == 200){
       print("${result.body}");
       List<Product> body =  getdata(result.body);
       print("${body.length}");
     return body;
    }else {
       throw Exception('Failed to load album');
     }
  }


