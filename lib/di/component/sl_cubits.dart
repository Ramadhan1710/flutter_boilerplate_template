import '../../features/auth/presentation/bloc/auth/auth_cubit.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import 'service_locator.dart';

Future<void> configureCubitDependencies() async {
  getIt.registerFactory(() => SplashBloc(sessionHelper: getIt.get()));
  getIt.registerFactory(() => AuthCubit(sessionHelper: getIt.get()));
}