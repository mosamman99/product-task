import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/ui/app_ui.dart';
import '../../../../../core/ui/components.dart';
class OnboardPage2 extends StatelessWidget {
  const OnboardPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text("Circuit",style: GoogleFonts.philosopher(textStyle: Theme.of(context).textTheme.bodyText1,color: AppUI.whiteColor,fontSize: 65,fontWeight: FontWeight.w700),),
                      Row(
                        children: const [
                          CustomText(text: "30%",fontSize: 40,),
                          CustomText(text: " Discount",fontSize: 26,fontWeight: FontWeight.w600,),
                        ],
                      ),
                      const CustomText(text: " in technology",fontSize: 24,),
                      const CustomText(text: " FREE SHIPPING",fontSize: 12,fontWeight: FontWeight.w600,),
                    ],
                  ),
                  Image.asset("${AppUI.imgPath}Vector.png"),
                ],
              ),
              Image.asset(
                "${AppUI.imgPath}splash.png",
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const CustomText(text: "*Valid from 27/03 to 01/04 2022. Min stock: 1 unit",fontSize: 10,fontWeight: FontWeight.w500,)

            ],
          ),
        ),
      ],
    );
  }
}
