import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/core/ui/components.dart';
import '../../../checkout/presentation/view/cart_screen.dart';
import '../../../favorite/presentation/view/favorite_screen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../../../profile/presentation/view/profile_screen.dart';
import '../controller/bottom_nav_cubit.dart';
import '../controller/bottom_nav_states.dart';
import 'bottom_nav_widget.dart';

class BottomNavTabsScreen extends StatefulWidget {
  const BottomNavTabsScreen({Key? key}) : super(key: key);

  @override
  _BottomNavTabsScreenState createState() => _BottomNavTabsScreenState();
}

class _BottomNavTabsScreenState extends State<BottomNavTabsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const CustomBackground(),
          context.watch<BottomNavCubit>().currentIndex==0?const HomeScreen():context.watch<BottomNavCubit>().currentIndex==1?const CartScreen():context.watch<BottomNavCubit>().currentIndex==2?const FavoriteScreen():const ProfileScreen(),
          BlocBuilder<BottomNavCubit,BottomNavState>(
              buildWhen: (context,state) => state is ChangeState,
              builder: (context, state,) {
                var bottomNavProvider = BottomNavCubit.get(context);
                return BottomNavBar(currentIndex: bottomNavProvider.currentIndex,
                  onTap0: (){
                    bottomNavProvider.setCurrentIndex(0);
                  },
                  onTap1: (){
                    bottomNavProvider.setCurrentIndex(1);
                  },
                  onTap2: (){
                    bottomNavProvider.setCurrentIndex(2);
                  },

                  onTap3: (){
                    bottomNavProvider.setCurrentIndex(3);
                  },

                );
              }
          ),
        ],
      ),
    );
  }
}
