import 'package:bloc/bloc.dart';
import 'package:med_app/screens/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthSplash(3.5)) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(AuthInitial());
    });
  }

  bool _isShown = false;

  get getShown => _isShown;

  void obSecure() {
    _isShown = !_isShown;
  }

  changeState(AuthState state) {
    emit(state);
  }
}
