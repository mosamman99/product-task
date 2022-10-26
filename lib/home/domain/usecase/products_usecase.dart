
import 'package:dartz/dartz.dart';
import 'package:products_task/home/data/models/product_model.dart';

import '../../../core/error/error_message_model.dart';
import '../repository/base_currency_repository.dart';

class ProductsUseCase{
  final BaseProductsRepository baseProductsRepository;

  ProductsUseCase(this.baseProductsRepository);
  Future<Either<ErrorMessageModel ,List<ProductModel>>> execute({String? search,int? skip}) async {
    return await baseProductsRepository.fetchProducts(search: search, skip: skip);
  }
}