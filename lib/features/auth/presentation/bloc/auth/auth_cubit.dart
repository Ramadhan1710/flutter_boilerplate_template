import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_template/core/helpers/session/base_session_helper.dart';
import 'package:flutter_boilerplate_template/features/auth/presentation/bloc/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseSessionHelper _sessionHelper;

  AuthCubit({required BaseSessionHelper sessionHelper})
    : _sessionHelper = sessionHelper,
      super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    await _sessionHelper.setToken('123');

    emit(AuthLoginSuccess());
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await _sessionHelper.clear();
    emit(AuthLogoutSuccess());
  }
}
