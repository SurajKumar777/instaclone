import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void clickHandler(email, password) {
    if (email == "suraj@yopmail.com" && password == "Suraj@123") {
      emit(LoginSuccess());
    } else {
      emit(LoginError());
    }
  }
}
