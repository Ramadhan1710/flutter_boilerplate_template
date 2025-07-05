import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_template/di/component/service_locator.dart';
import 'package:flutter_boilerplate_template/features/splash/presentation/bloc/splash_event.dart';
import 'package:go_router/go_router.dart';

import '../bloc/splash_bloc.dart';
import '../bloc/splash_state.dart';
import '../widgets/splash_screen.dart';
import '../../../../routes/route_paths.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = getIt<SplashBloc>()..add(SplashNavigateRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashBloc,
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            context.go(RoutePaths.home);
          } else if (state is SplashNavigateToLogin) {
            context.go(RoutePaths.login);
          }
        },
        child: SplashScreen(),
      ),
    );
  }
}
