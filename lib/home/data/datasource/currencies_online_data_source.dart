
import 'dart:convert';

import 'package:products_task/home/data/models/product_model.dart';

import '../../../core/error/error_message_model.dart';
import '../../../core/network_helper.dart';


abstract class BaseProductsOnlineDataSource{
  Future<List<ProductModel>> fetchProducts({String search, int? skip});
}

class ProductsOnlineDataSource extends BaseProductsOnlineDataSource{
  @override
  fetchProducts({String? search, int? skip}) async {
    var response =  await NetworkHelper.repo(search==''?"products?skip=$skip":"products/search?q=$search","get");
    if(response.statusCode == 200){
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
      return List<ProductModel>.of((mapResponse['products'] as List).map((e) => ProductModel.fromJson(e)));
    }else{
      throw ErrorMessageModel.fromJson({"status": 401, "error": "Error Fetch Data"});
    }
  }

}