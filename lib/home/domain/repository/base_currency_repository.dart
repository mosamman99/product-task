
import 'package:dartz/dartz.dart';
import 'package:products_task/home/data/models/product_model.dart';

import '../../../core/error/error_message_model.dart';


abstract class BaseProductsRepository{
  Future<Either<ErrorMessageModel ,List<ProductModel>>> fetchProducts({String? search, int? skip});

}