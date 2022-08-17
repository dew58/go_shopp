
import 'package:go_shop/productmodel.dart';
import 'package:http/http.dart' as http;



  Future<List<Product>> fetchProduct() async{
    var result =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));
    print("1111");
     if(result.statusCode == 200){

       print("${result.body}");
       List<Product> body =  getdata(result.body);
    // List<Product> products = body.map<Product>((json)=> Product.fromJson(json)).toList();

     return body;
    }else
      throw Exception('Failed to load album');


  }


