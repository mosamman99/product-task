import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:products_task/core/app_util.dart';

import '../../../core/ui/app_ui.dart';
import '../../../core/ui/components.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    children: [
                      CustomCard(
                        radius: 24,width: 47,height: 47,
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,color: AppUI.disableColor,size: 19,),
                      ),
                      const SizedBox(width: 19,),
                      CustomText(text: "Checkout",fontSize: 16,fontWeight: FontWeight.w500,color: AppUI.greyColor,)
                    ],
                  ),
                ),
                const SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        const CustomCard(
                          height: 72,width: 77,radius: 22,elevation: 0,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SizedBox(),
                          ),
                        ),
                        Image.asset("${AppUI.imgPath}sub.png",height: 90,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "Sony WH-1000XM4",color: AppUI.greyColor,fontSize: 22,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,),
                        CustomText(text: "\$ 2,999",color: AppUI.secondColor,fontSize: 20,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 26,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomText(text: "Shipping method",fontSize: 16,fontWeight: FontWeight.w500,color: AppUI.greyColor,),
                ),
                const SizedBox(height: 8,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  height: 37,
                  padding: const EdgeInsets.all(3),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: AppUI.greyColor,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Container(
                        width: AppUtil.responsiveWidth(context)*0.5,
                        height: 37,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: AppUI.whiteColor,
                        ),
                        alignment: Alignment.center,
                        child: CustomText(text: "Home delivery",fontSize: 12,fontWeight: FontWeight.w400,color: AppUI.greyColor,),
                      ),
                      Container(
                        width: AppUtil.responsiveWidth(context)*0.4,
                        height: 37,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        alignment: Alignment.center,
                        child: CustomText(text: "Pick up in store",fontSize: 12,fontWeight: FontWeight.w400,color: AppUI.whiteColor,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomText(text: "Select your payment method",fontSize: 16,fontWeight: FontWeight.w500,color: AppUI.greyColor,),
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset("${AppUI.imgPath}visa.png"),
                        Image.asset("${AppUI.imgPath}visa.png",height: 180,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomText(text: "+ Add New",fontSize: 16,fontWeight: FontWeight.w500,color: AppUI.greyColor,),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Image.asset("${AppUI.imgPath}google.png"),
                      const SizedBox(width: 10,),
                      Image.asset("${AppUI.imgPath}apple.png"),
                      const SizedBox(width: 10,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("${AppUI.imgPath}rectangle.png"),
                          Image.asset("${AppUI.imgPath}pay_bal.png"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 21,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppUI.whiteColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(46),topRight: Radius.circular(46)),
              ),
              padding: const EdgeInsets.all(34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(text: "Subtotal (2 items)",color:  AppUI.greyColor,fontWeight: FontWeight.w500,),
                      const Spacer(),
                      CustomText(text: "\$ 2,999",color:  AppUI.greyColor,fontWeight: FontWeight.w500,),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      CustomText(text: "Shipping cost",color:  AppUI.greyColor,fontWeight: FontWeight.w500,),
                      const Spacer(),
                      CustomText(text: "Free",color:  AppUI.greyColor,fontWeight: FontWeight.w500,),
                    ],
                  ),const SizedBox(height: 10,),
                  Image.asset("${AppUI.imgPath}line.png"),
                  const SizedBox(height: 10,),

                  Row(
                    children: [
                      CustomText(text: "Total",color:  AppUI.greyColor,fontSize: 16,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,),
                      const Spacer(),
                      CustomText(text: "\$ 2,999",color:  AppUI.greyColor,fontSize: 16,fontWeight: FontWeight.w500,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  CustomButton(text: "Buy Now",fontSize: 18,width: AppUtil.responsiveWidth(context)*0.9,fontStyle: FontStyle.italic,onPressed: (){
                  },)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
