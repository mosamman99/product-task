import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState>{
  OnBoardingCubit():super(OnBoardingInitState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    emit(OnBoardingChangeIndexState());
  }

}