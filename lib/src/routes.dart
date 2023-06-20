import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';
import 'features/IDSDP/presentation/pages/home.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
