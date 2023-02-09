import 'package:dark_week/app/models/auth_model.dart';
import 'package:dark_week/app/pages/auth/login/login_state.dart';
import 'package:dark_week/app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.login));
    final authModel = await _authRepository.login(email, password);
    final sp = await SharedPreferences.getInstance();
    sp.setString("accessToken ", authModel.accessToken);
    sp.setString("refreshToken ", authModel.accessToken);
  }
}
