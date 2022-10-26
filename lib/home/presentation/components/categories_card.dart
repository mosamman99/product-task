import 'package:flutter/material.dart';

import '../../../core/ui/app_ui.dart';
import '../../../core/ui/components.dart';
class CategoriesCard extends StatelessWidget {
  final int index;
  const CategoriesCard({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppUI.whiteColor
          ),
          child: CustomText(text: "Technology",fontWeight: FontWeight.w500,fontSize: 16,color: AppUI.blackColor,),
        ),
        if(index != 4)
          const SizedBox(width: 13,)
      ],
    );
  }
}
