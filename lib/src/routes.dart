import 'package:ek_sheba/src/features/IDSDP/presentation/pages/dashboard_item_details_page.dart';
import 'package:ek_sheba/src/features/IDSDP/presentation/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';
import 'features/IDSDP/presentation/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/dashboard_item',
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
    GoRoute(
      path: '/dashboard_item',
      builder: (context, state) {
        final itemTitle = state.extra as Map?;
        return DashBoardItemDetailsPage(itemTitle: itemTitle?['itemTitle'] ?? "in Preparation");
      },
    )
  ],
);
