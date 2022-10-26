import 'package:flutter/material.dart';

import '../../../core/ui/app_ui.dart';
import '../../../core/ui/components.dart';
class HotSalesCard extends StatelessWidget {
  final int index;
  const HotSalesCard({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset("${AppUI.imgPath}product_background.png",width: 128,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,width: 63,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppUI.whiteColor
                    ),
                    child: CustomText(text: "Free shipping",fontWeight: FontWeight.w500,fontSize: 8,color: AppUI.secondColor,),
                  ),
                  const SizedBox(height: 10,),
                  Image.asset("${AppUI.imgPath}laptop.png"),
                  const SizedBox(height: 2,),
                  CustomText(text: "Macbook Air M1",fontSize: 10,fontWeight: FontWeight.w500,color: AppUI.blackColor,),
                  const SizedBox(height: 2,),
                  CustomText(text: "\$ 24,999 ",fontSize: 12,fontWeight: FontWeight.w700,color: AppUI.blackColor,),
                ],
              ),
            ),
          ],
        ),
        if(index != 4)
          const SizedBox(width: 13,)
      ],
    );
  }
}
