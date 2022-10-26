import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/home/domain/entities/product.dart';
import 'package:products_task/home/presentation/controller/products_state.dart';

import '../../../core/error/error_message_model.dart';
import '../../data/datasource/currencies_online_data_source.dart';
import '../../data/models/product_model.dart';
import '../../data/repository/currency_repository.dart';
import '../../domain/repository/base_currency_repository.dart';
import '../../domain/usecase/products_usecase.dart';

class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit(): super(ProductsInitState());
  static ProductsCubit get(context) => BlocProvider.of(context);

  BaseProductsOnlineDataSource baseProductsOnlineDataSource = ProductsOnlineDataSource();


  int skip = 0;
  List<Product> products = [];
  late ErrorMessageModel errorMessageModel;
  ScrollController productsScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  getProducts() async {
    if(skip == 0) {
      emit(ProductsLoadingState());
    }else{
      emit(ProductsLoadingPaginateState());
    }
    BaseProductsRepository baseCurrencyRepository = ProductsRepository(baseProductsOnlineDataSource);
    final Either<ErrorMessageModel ,List<ProductModel>> result = await ProductsUseCase(baseCurrencyRepository).execute(skip: skip,search: searchController.text);
    result.fold((l) {
      errorMessageModel = l;
      if(skip == 0){
        emit(ProductsErrorState());
      }else{
        emit(ProductsErrorPaginateState());
      }
    }, (r) {
      r.map((e) => products.add(e)).toList();
      if(r.isEmpty && skip == 0){
        emit(ProductsEmptyState());
      }else if(r.isEmpty && skip > 0){
        emit(ProductsEmptyPaginateState());
      }else {
        emit(ProductsLoadedState());
      }
    });
  }

}