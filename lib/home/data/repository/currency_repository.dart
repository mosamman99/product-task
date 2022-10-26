
import 'package:dartz/dartz.dart';
import 'package:products_task/home/data/models/product_model.dart';

import '../../../core/error/error_message_model.dart';
import '../../domain/repository/base_currency_repository.dart';
import '../datasource/currencies_online_data_source.dart';

class ProductsRepository extends BaseProductsRepository{
  final BaseProductsOnlineDataSource baseProductsOnlineDataSource;

  ProductsRepository(this.baseProductsOnlineDataSource);
  @override
  Future<Either<ErrorMessageModel ,List<ProductModel>>> fetchProducts({String? search, int? skip}) async {
    try {
      final result = await baseProductsOnlineDataSource.fetchProducts(search: search??'', skip: skip);
      return Right(result);
    } on ErrorMessageModel catch(e){
      return Left(ErrorMessageModel(status: e.status, error: e.error));
    }
  }

}