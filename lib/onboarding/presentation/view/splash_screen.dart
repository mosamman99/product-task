import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/core/ui/app_ui.dart';
import 'package:products_task/core/app_util.dart';
import 'package:products_task/core/ui/components.dart';
import '../../../layout/presentation/view/bottom_nav_tabs_screen.dart';
import '../controller/onboarding_cubit.dart';
import '../controller/onboarding_state.dart';
import 'onboard_pages/onboard_page1.dart';
import 'onboard_pages/onboard_page2.dart';
import 'onboard_pages/onboard_page3.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = OnBoardingCubit.get(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const CustomBackground(),
          CarouselSlider(
              items: const [
                OnboardPage1(),
                OnboardPage2(),
                OnboardPage3(),
              ],
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                autoPlay: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int index,CarouselPageChangedReason reason){
                  cubit.currentIndex = index;
                }
              )
          ),
          Positioned(
            bottom: 70,
            child: Column(
              children: [
                CustomButton(text: "LOG IN",color: AppUI.whiteColor,textColor: AppUI.secondColor,fontSize: 14,width: AppUtil.responsiveWidth(context)*0.8,),
                const SizedBox(height: 20,),
                BlocBuilder<OnBoardingCubit,OnBoardingState>(
                  buildWhen: (_,state) => state is OnBoardingChangeIndexState,
                  builder: (context, snapshot) {
                    return DotWidget(length: 3,currentIndex: cubit.currentIndex,);
                  }
                ),
              ],
            )
          ),

          Positioned(
            bottom: 30,right: 30,
            child: InkWell(
              onTap: (){
                AppUtil.mainNavigator(context, const BottomNavTabsScreen());
              },
                child: const CustomText(text: "SKIP",))
          ),

        ],
      ),
    );
  }
}
