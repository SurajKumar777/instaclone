import 'package:bloc/bloc.dart';

part 'landing_page_state.dart';

class LandingPageCubit extends Cubit<LandingPageState> {
  LandingPageCubit() : super(LandingPageInitial(0));

  onTabClicked(index) {
    emit(LandingPageState(index));
  }
}
