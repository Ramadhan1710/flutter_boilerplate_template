import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/helpers/session/base_session_helper.dart';
import '../../core/helpers/session/shared_pref_helper.dart';
import '../module/local_module.dart';
import 'sl_repositories.dart';
import 'sl_cubits.dart';
import 'sl_data_sources.dart';
import 'sl_use_cases.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<SharedPreferences>(
    await LocalModule.provideSharedPreferences(),
  );
  getIt.registerSingleton<BaseSessionHelper>(SharedPrefHelper(getIt.get()));

  await configureDataSourceDependencies();
  await configureRepositoryDependencies();
  await configureUseCaseDependencies();
  await configureCubitDependencies();

  await getIt.allReady();
}
