import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/ui/app_ui.dart';
import '../../../../../core/ui/components.dart';

class BottomNavBar extends StatelessWidget {
  final Function() onTap0,onTap1,onTap2,onTap3;
  final int currentIndex;
  const BottomNavBar({Key? key,required this.currentIndex,required this.onTap0,required this.onTap1,required this.onTap2,required this.onTap3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 102,
          decoration:  BoxDecoration(borderRadius: const BorderRadius.only(topRight: Radius.circular(40),topLeft:  Radius.circular(40),),color: AppUI.whiteColor.withOpacity(0.75)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onTap0,
                  child: Container(
                    height: currentIndex==0?40:null,width: currentIndex==0?110:null,
                    decoration: currentIndex==0?BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppUI.secondColor.withOpacity(0.32)):null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("${AppUI.iconPath}home.svg",height: 30,width: 30,color: currentIndex==0?AppUI.secondColor:AppUI.disableColor,),
                        if(currentIndex == 0)
                          const SizedBox(width: 10,),
                        if(currentIndex == 0)
                        CustomText(text: "Home",textAlign: TextAlign.center,color: currentIndex==0?AppUI.secondColor:AppUI.disableColor,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap1,
                  child: Container(
                    height: currentIndex==1?40:null,width: currentIndex==1?110:null,
                    decoration: currentIndex==1?BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppUI.secondColor.withOpacity(0.32)):null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("${AppUI.iconPath}cart.svg",height: 30,width: 30,color: currentIndex==1?AppUI.secondColor:AppUI.disableColor,),
                        if(currentIndex == 1)
                          const SizedBox(width: 10,),
                        if(currentIndex == 1)
                          CustomText(text: "Cart",textAlign: TextAlign.center,color: currentIndex==1?AppUI.secondColor:AppUI.disableColor,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap2,
                  child: Container(
                    height: currentIndex==2?40:null,width: currentIndex==2?110:null,
                    decoration: currentIndex==2?BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppUI.secondColor.withOpacity(0.32)):null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("${AppUI.iconPath}fav.svg",height: 30,width: 30,color: currentIndex==2?AppUI.secondColor:AppUI.disableColor,),
                        if(currentIndex == 2)
                          const SizedBox(width: 10,),
                        if(currentIndex == 2)
                          CustomText(text: "Favorite",textAlign: TextAlign.center,color: currentIndex==2?AppUI.secondColor:AppUI.disableColor,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap3,
                  child: Container(
                    height: currentIndex==3?40:null,width: currentIndex==3?110:null,
                    decoration: currentIndex==3?BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppUI.secondColor.withOpacity(0.32)):null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("${AppUI.iconPath}profile.svg",height: 30,width: 30,color: currentIndex==3?AppUI.secondColor:AppUI.disableColor,),
                        if(currentIndex == 3)
                          const SizedBox(width: 10,),
                        if(currentIndex == 3)
                          CustomText(text: "Profile",textAlign: TextAlign.center,color: currentIndex==3?AppUI.secondColor:AppUI.disableColor,fontWeight: FontWeight.w500,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
