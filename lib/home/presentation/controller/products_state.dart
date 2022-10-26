abstract class ProductsState{}
class ProductsInitState extends ProductsState{}

class ProductsLoadingState extends ProductsState{}
class ProductsLoadingPaginateState extends ProductsState{}

class ProductsErrorState extends ProductsState{}
class ProductsErrorPaginateState extends ProductsState{}

class ProductsEmptyState extends ProductsState{}
class ProductsEmptyPaginateState extends ProductsState{}

class ProductsLoadedState extends ProductsState{}
