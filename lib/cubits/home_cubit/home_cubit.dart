import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial(30));

  void onInitialTimer() {
    Timer? timer;
    var tempCount = 30;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      tempCount = tempCount - 1;
      log(tempCount.toString());
      if (tempCount <= 0) {
        timer.cancel();
        emit(HomeSuccessState());
      } else {
        emit(HomeInitial(tempCount));
      }
    });

    @override
    Future<void> close() async {
      return super.close();
    }
  }
}
