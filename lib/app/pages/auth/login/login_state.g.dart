// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LoginStatusMatch on LoginStatus {
  T match<T>(
      {required T Function() inicial,
      required T Function() login,
      required T Function() sucesso,
      required T Function() loginError,
      required T Function() error}) {
    final v = this;
    if (v == LoginStatus.inicial) {
      return inicial();
    }

    if (v == LoginStatus.login) {
      return login();
    }

    if (v == LoginStatus.sucesso) {
      return sucesso();
    }

    if (v == LoginStatus.loginError) {
      return loginError();
    }

    if (v == LoginStatus.error) {
      return error();
    }

    throw Exception('LoginStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? inicial,
      T Function()? login,
      T Function()? sucesso,
      T Function()? loginError,
      T Function()? error}) {
    final v = this;
    if (v == LoginStatus.inicial && inicial != null) {
      return inicial();
    }

    if (v == LoginStatus.login && login != null) {
      return login();
    }

    if (v == LoginStatus.sucesso && sucesso != null) {
      return sucesso();
    }

    if (v == LoginStatus.loginError && loginError != null) {
      return loginError();
    }

    if (v == LoginStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
