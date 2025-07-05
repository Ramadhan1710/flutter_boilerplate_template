import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/session/base_session_helper.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final BaseSessionHelper _sessionHelper;
  SplashBloc({required BaseSessionHelper sessionHelper})
    : _sessionHelper = sessionHelper,
      super(SplashInitial()) {
    on<SplashNavigateRequested>(_onNavigateRequested);
  }

  FutureOr<void> _onNavigateRequested(
    SplashNavigateRequested event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    if (_isLoggedIn()) {
      debugPrint('User is logged in, navigating to home');
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }

  bool _isLoggedIn() {
    String? authToken = _sessionHelper.getToken();
    return authToken != null && authToken.isNotEmpty;
  }
}
