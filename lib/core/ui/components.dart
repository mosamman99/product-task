
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'app_ui.dart';
import '../app_util.dart';


AppBar customAppBar ({required title,Widget? leading,List<Widget>? actions,int elevation = 3,Widget? bottomChild,Color? backgroundColor,bottomChildHeight,leadingWidth}){
  return AppBar(
    backgroundColor: backgroundColor??AppUI.secondColor,
    elevation: double.parse(elevation.toString()),
    title: title is Widget? title : CustomText(text: title, fontSize: 18.0,color: AppUI.whiteColor,fontWeight: FontWeight.w600,),
    centerTitle: false,
    leading: leading,
    leadingWidth: leadingWidth??110,
    actions: actions,
    bottom: bottomChild==null?null:PreferredSize(preferredSize: Size.fromHeight(bottomChildHeight??120),child: bottomChild,),
  );
}


class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color? color;
  final TextDecoration? textDecoration;
  const CustomText({Key? key,@required this.text,this.fontSize = 14,this.textAlign,this.fontStyle = FontStyle.normal,this.fontWeight = FontWeight.w400,this.color,this.textDecoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text??"",textAlign: textAlign ??TextAlign.left,style: TextStyle(color: color??AppUI.whiteColor,fontSize: fontSize,fontStyle: fontStyle,fontWeight: fontWeight,decoration: textDecoration),textDirection: ui.TextDirection.ltr,);
  }
}

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "${AppUI.imgPath}Ellipse 220.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              "${AppUI.imgPath}Ellipse 1.png",
            )),
        Image.asset(
          "${AppUI.imgPath}Ellipse 2.png",
          height: AppUtil.responsiveHeight(context)*0.8,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Image.asset(
          "${AppUI.imgPath}Ellipse 219.png",
          height: AppUtil.responsiveHeight(context)*0.9,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}



class CustomButton extends StatelessWidget {
  final Color? color;
  final int radius;
  final String text;
  final FontStyle fontStyle;
  final Color? textColor,borderColor;
  final Function()? onPressed;
  final double? width,height,fontSize;
  final Widget? child;
  const CustomButton({Key? key,required this.text,this.onPressed,this.fontStyle = FontStyle.normal,this.fontSize = 16,this.color,this.borderColor,this.radius = 35,this.textColor = Colors.white,this.width,this.child,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: height??16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(double.parse("$radius")),
            color: color??AppUI.secondColor,
            border: borderColor==null?null:Border.all(color: borderColor!)
          ),
          alignment: Alignment.center,
          child: child??CustomText(text: text, fontSize: fontSize??16.0,color: textColor,fontStyle: fontStyle,)),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? height,width;
  final Color? color;
  final double? elevation,radius,padding;
  final Color? border;
  final Function()? onTap;
  const CustomCard({Key? key,required this.child,this.height,this.width,this.color,this.elevation,this.border,this.onTap,this.radius,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??15)
        ),
        elevation: elevation??4,
        color: color??AppUI.whiteColor,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius??15),
            border: border!=null?Border.all(color: border!):null,
            color: color??AppUI.whiteColor,
          ),
          child: child,
        ),
      ),
    );
  }
}



class CustomInput extends StatelessWidget {
  final String? hint,lable;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function()? onTap;
  final Function(String v)? onChange;
  final bool obscureText,readOnly,autofocus,validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines , maxLength;
  final double radius;
  final double? contentPaddingVertical;
  final TextAlign? textAlign;
  final Color? borderColor,fillColor;
  const CustomInput({Key? key,required this.controller,this.hint,this.lable,required this.textInputType,this.obscureText = false,this.prefixIcon,this.suffixIcon,this.onTap,this.onChange,this.maxLines,this.textAlign,this.readOnly = false,this.autofocus = false,this.radius = 25.0,this.maxLength,this.validation=true,this.borderColor,this.fillColor,this.contentPaddingVertical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onTap: onTap,
      readOnly: readOnly,
      // maxLength: maxLength,
      keyboardType: textInputType,
      textAlign: textAlign??TextAlign.left,
      onChanged: onChange,
      validator: validation?(v){
        if(v!.isEmpty) {
          return "fieldRequired";
        }
        return null;
      }:null,
      autofocus: autofocus,
      maxLines: maxLines??1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppUI.disableColor,fontSize: 12),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: suffixIcon,
        ),
        labelText: lable,
        // labelStyle: TextStyle(color: AppUI.secondColor),
        filled: true,
        fillColor: fillColor??AppUI.whiteColor,
        suffixIconConstraints: const BoxConstraints(
            minWidth: 63
        ),
        prefixIconConstraints: const BoxConstraints(
            minWidth: 60,
          maxHeight: 25
        ),
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:contentPaddingVertical?? AppUtil.responsiveHeight(context)*0.0153),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius) ),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.secondColor,width: 0.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor)
        ),

      ),
    );
  }
}


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

}


class EmptyTextWidget extends StatelessWidget {
  const EmptyTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CustomText(text: "noDataAvailable",fontSize: 18,),
    );
  }
}

class ErrorTextWidget extends StatelessWidget {
  final String message;
  const ErrorTextWidget({Key? key,required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CustomText(text: message ,fontSize: 18,),
    );
  }
}

class DotWidget extends StatelessWidget {
  final int length;
  final int currentIndex;
  const DotWidget({Key? key,required this.length,required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Row(
          children: [
            if(currentIndex == index)
              Container(
                width: 16,height: 4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppUI.secondColor),
              )
            else
            CircleAvatar(
              radius: 3,
              backgroundColor: AppUI.disableColor,
            ),
            const SizedBox(width: 7,),
          ],
        );
        }),
    );
  }
}

