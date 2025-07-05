import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate_template/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:flutter_boilerplate_template/routes/app_routes.dart';
import 'core/helpers/logging/logger_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/theme/app_theme.dart';
import 'di/component/service_locator.dart';

Future<void> main() async {
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      //await dotenv.load(fileName: ".env");
      await setPreferredOrientations();
      await setupLocator();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<AuthCubit>()),
          ],
          child: const MyApp(),
        )
      );
    },
    (error, stack) {
      LoggerHelper.logger.d(error);
      LoggerHelper.logger.d(stack);

      EasyLoading.showError(error.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Boilerplate Template',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
