import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:products_task/core/app_util.dart';
import 'package:products_task/core/ui/app_ui.dart';
import 'package:products_task/core/ui/components.dart';
import '../../../checkout/presentation/view/checkout_screen.dart';
import '../../domain/entities/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  const ProductDetailsScreen({Key? key,required this.product}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackground(),
          SingleChildScrollView(
            child: Column(
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
                      const Spacer(),
                      CustomCard(
                        radius: 24,width: 47,height: 47,
                        child: SvgPicture.asset("${AppUI.iconPath}fav.svg"),
                      ),
                      CustomCard(
                        radius: 24,width: 47,height: 47,
                        child: Icon(Icons.share_outlined,color: AppUI.disableColor,size: 19,),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 33,vertical: 3),
                  child: Stack(
                    children: [
                      CustomCard(
                        height: 323,width: double.infinity,elevation: 0,radius: 62,color: AppUI.whiteColor.withOpacity(0.65),
                        child: const Padding(
                          padding: EdgeInsets.all(35.0),
                          child: CustomCard(
                            width: double.infinity,elevation: 0,radius: 62,
                            child: SizedBox(),
                          ),
                        ),
                      ),
                      Image.asset("${AppUI.imgPath}sub.png",height: 320,)
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                const DotWidget(length: 3, currentIndex: 1),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      height: 73,width: 73,radius: 22,elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset("${AppUI.imgPath}sub2.png"),
                      ),
                    ),
                    const SizedBox(width: 18,),
                    CustomCard(
                      height: 73,width: 73,radius: 22,elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset("${AppUI.imgPath}sub.png"),
                      ),
                    ),
                    const SizedBox(width: 18,),
                    CustomCard(
                      height: 73,width: 73,radius: 22,elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset("${AppUI.imgPath}sub3.png"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 236,),

              ],),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: AppUI.whiteColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(46),topRight: Radius.circular(46)),
              ),
              padding: const EdgeInsets.only(top: 34,left: 34,right: 34),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CustomText(text: "FREE SHIPPING",color:  Color(0xff909090),fontSize: 12,fontWeight: FontWeight.w500,),
                        const Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset("${AppUI.iconPath}star.svg"),
                            const CustomText(text: "4.0",color:  Color(0xff3F4343),fontSize: 18,fontWeight: FontWeight.w100,fontStyle: FontStyle.italic,),
                            const SizedBox(width: 6,),
                            const CustomText(text: "(231)",color:  Color(0xff909090),fontSize: 12,fontWeight: FontWeight.w400,),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 19,),
                    CustomText(text: "Sony WH-1000XM4",color: AppUI.greyColor,fontSize: 22,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,),
                    const SizedBox(height: 16,),
                    const CustomText(text: "The intuitive and intelligent WH-1000XM4 headphones bring you new improvements in industry-leading noise cancelling technology.",color: Color(0xff909090),fontSize: 13,fontWeight: FontWeight.w500,),
                    const SizedBox(height: 22,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: "\$ 2,999",color: AppUI.secondColor,fontSize: 20,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xff3F4343)),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: const EdgeInsets.all(3),
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xff3F4343),
                          ),
                        ),
                        const SizedBox(width: 6,),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xffCCC6BA),
                        ),
                        const SizedBox(width: 6,),
                        const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xffCFCFCF),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28,),
                    Row(
                      children: [
                        Container(
                          width: 94,height: 34,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),border: Border.all(color: const Color(0xffC4C4C4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              CustomText(text: "-",fontWeight: FontWeight.bold,color: Color(0xffC4C4C4),fontSize: 30,),
                              CustomText(text: "1",fontWeight: FontWeight.bold,color: Color(0xffC4C4C4),fontSize: 20,),
                              CustomText(text: "+",fontWeight: FontWeight.bold,color: Color(0xffC4C4C4),fontSize: 20,),
                            ],
                          ),
                        ),
                        const Spacer(),
                        CustomButton(text: "Buy Now",fontSize: 18,width: AppUtil.responsiveWidth(context)*0.55,fontStyle: FontStyle.italic,onPressed: (){
                          AppUtil.mainNavigator(context, const CheckoutScreen());
                        },)
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
