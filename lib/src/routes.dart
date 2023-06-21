import 'package:ek_sheba/src/features/IDSDP/presentation/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';
import 'features/IDSDP/presentation/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
