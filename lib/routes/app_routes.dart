import 'package:go_router/go_router.dart';

import 'route_names.dart';
import 'route_paths.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.splash,
  routes: [
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
