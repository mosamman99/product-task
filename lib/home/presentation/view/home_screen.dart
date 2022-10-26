import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_task/core/ui/app_ui.dart';
import 'package:products_task/core/app_util.dart';
import 'package:products_task/core/ui/components.dart';
import 'package:products_task/home/presentation/controller/products_cubit.dart';
import 'package:products_task/home/presentation/controller/products_state.dart';
import '../components/categories_card.dart';
import '../components/hot_sales_card.dart';
import '../components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductsCubit productsCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productsCubit = ProductsCubit.get(context);
    if (productsCubit.products.isEmpty) {
      productsCubit.getProducts();
    }
    productsCubit.productsScrollController.addListener(() async {
      if (productsCubit.productsScrollController.position.pixels ==
          productsCubit.productsScrollController.position.maxScrollExtent) {
        productsCubit.skip += 30;
        productsCubit.getProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: productsCubit.productsScrollController,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              SizedBox(
                  width: AppUtil.responsiveWidth(context) * 0.79,
                  child: CustomInput(
                    controller: productsCubit.searchController,
                    hint: "Search products",
                    prefixIcon: InkWell(
                        onTap: () {
                          productsCubit.skip = 0;
                          productsCubit.products.clear();
                          productsCubit.getProducts();
                        },
                        child: SvgPicture.asset(
                          "${AppUI.iconPath}search.svg",
                        )),
                    onChange: (v) {
                      if (v.isEmpty) {
                        productsCubit.skip = 0;
                        productsCubit.products.clear();
                        productsCubit.getProducts();
                      }
                    },
                    textInputType: TextInputType.text,
                    borderColor: AppUI.whiteColor,
                  )),
              const Spacer(),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: AppUI.whiteColor,
                    child:
                        SvgPicture.asset("${AppUI.iconPath}notification.svg"),
                  ),
                  CircleAvatar(
                    backgroundColor: AppUI.errorColor,
                    radius: 7,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 38,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset("${AppUI.imgPath}home_banner.png"),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return CategoriesCard(
                  index: index,
                );
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              CustomText(
                text: "Hot Sales",
                color: AppUI.greyColor,
                fontStyle: FontStyle.italic,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              const DotWidget(length: 4, currentIndex: 0)
            ],
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: 148,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(5, (index) {
                return HotSalesCard(index: index);
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 23,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomText(
            text: "Technology",
            color: AppUI.greyColor,
            fontStyle: FontStyle.italic,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BlocBuilder<ProductsCubit, ProductsState>(
              buildWhen: (_, state) =>
                  state is ProductsLoadingState ||
                  state is ProductsLoadingPaginateState ||
                  state is ProductsLoadedState ||
                  state is ProductsErrorState ||
                  state is ProductsErrorPaginateState ||
                  state is ProductsEmptyState ||
                  state is ProductsEmptyPaginateState,
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  return const LoadingWidget();
                }
                if (state is ProductsEmptyState) {
                  return const EmptyTextWidget();
                }
                if (state is ProductsErrorState) {
                  return ErrorTextWidget(
                    message: productsCubit.errorMessageModel.error,
                  );
                }

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(5),
                      crossAxisSpacing: 20,
                      childAspectRatio: (150 / 145),
                      children:
                          List.generate(productsCubit.products.length, (index) {
                        return ProductCard(
                            index: index,
                            product: productsCubit.products[index]);
                      }),
                    ),
                    SizedBox(
                      height: state is ProductsLoadingPaginateState ||
                              state is ProductsEmptyPaginateState ||
                              state is ProductsErrorPaginateState
                          ? 90
                          : 0,
                      width: double.infinity,
                      child: state is ProductsEmptyPaginateState
                          ? const Text("No More Data")
                          : state is ProductsErrorPaginateState
                              ? const Text('Data Fetch Error')
                              : const LoadingWidget(),
                    )
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 105,
        ),
      ],
    );
  }
}
