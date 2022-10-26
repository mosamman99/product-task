import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:products_task/home/presentation/controller/products_cubit.dart';
import 'core/ui/app_ui.dart';
import 'layout/presentation/controller/bottom_nav_cubit.dart';
import 'onboarding/presentation/controller/onboarding_cubit.dart';
import 'onboarding/presentation/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(create: (context) => ProductsCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppUI.whiteColor,
          appBarTheme: const AppBarTheme(color: Colors.white,iconTheme: IconThemeData(color: Colors.white)),
          primarySwatch: AppUI.mainColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme).copyWith(
            bodyText1: GoogleFonts.roboto(textStyle: Theme.of(context).textTheme.bodyText1),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
