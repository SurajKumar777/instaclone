import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void clickHandler(email, password) {
    if (email != "suraj@yopmail.com" && password != "Suraj@123") {
      emit(LoginError("Cridentials not exist"));
    } else if (email != "suraj@yopmail.com") {
      emit(LoginError("Invalid email"));
    } else if (password != "Suraj@123") {
      emit(LoginError("Invalid password"));
    } else {
      emit(LoginSuccess());
    }
  }
}
