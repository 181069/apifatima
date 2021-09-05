import 'package:api/models/Product.dart';
import 'package:dio/dio.dart';

class ApiHelper{
  ApiHelper._();

  static ApiHelper apiHelper =  ApiHelper._();
  Dio dio=Dio();
 Future<List<String>> getAllCategories()async{
    String url='https://fakestoreapi.com/products/categories';
    Response response = await dio.get(url);
    List<dynamic> categories=response.data;

    return categories.map((e) => e.toString()).toList();
  }

  Future<List<Product>> getAllProducts()async{
    String url='https://fakestoreapi.com/products';
    Response response = await dio.get(url);
    List<dynamic> products=response.data;
    return products.map((e) => Product.fromJson(e)).toList();


  }

  Future<Product> getProductbyId(int id)async{
    String url='https://fakestoreapi.com/products/$id';
    Response response = await dio.get(url);
    dynamic product=response.data;
    return product.map((e) => Product.fromJson(e));


  }
}