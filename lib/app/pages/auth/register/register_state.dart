// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:match/match.dart';
part 'register_state.g.dart'; //28:00 //"TERMINAL: flutter pub run build_runner build"

@match
enum RegisterStatus {
  initial,
  register,
  success,
  error,
  status,
}

class RegisterState {
  final RegisterStatus status;

  RegisterState({
    required this.status,
  });

  const RegisterState.initial() : status = RegisterStatus.initial;

  RegisterState copyWith({
    RegisterStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
