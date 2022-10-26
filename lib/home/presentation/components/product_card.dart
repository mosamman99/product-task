import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:products_task/core/app_util.dart';
import 'package:products_task/home/domain/entities/product.dart';

import '../../../core/ui/app_ui.dart';
import '../../../core/ui/components.dart';
import '../view/product_details_screen.dart';
class ProductCard extends StatelessWidget {
  final int index;
  final Product product;
  const ProductCard({Key? key,required this.index, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppUtil.mainNavigator(context, ProductDetailsScreen(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppUI.whiteColor.withOpacity(0.7),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,right: 10,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppUI.whiteColor,
                child: SvgPicture.asset("${AppUI.iconPath}fav.svg",color: AppUI.errorColor,height: 12,),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(imageUrl: product.thumbnail,height: 80,width: 120,placeholder: (context, url) => Image.asset("${AppUI.imgPath}laptop.png",fit: BoxFit.fill,),
                  errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}laptop.png",fit: BoxFit.fill,),),
                const SizedBox(height: 5,),
                CustomText(text: product.title,fontSize: 10,fontWeight: FontWeight.w500,color: AppUI.blackColor,),
                const SizedBox(height: 2,),
                CustomText(text: "\$ ${product.price}",fontSize: 12,fontWeight: FontWeight.w700,color: AppUI.blackColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
