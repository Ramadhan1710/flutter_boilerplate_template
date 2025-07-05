abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashNavigateToHome extends SplashState {}

class SplashNavigateToLogin extends SplashState {}

class SplashNavigateToDebugChooseLoginMethod extends SplashState {}

class SplashFailure extends SplashState {
  final String message;

  SplashFailure({required this.message});
}