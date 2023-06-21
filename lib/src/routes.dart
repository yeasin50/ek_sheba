import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';

import 'features/IDSDP/presentation/pages/pages.dart';
import 'features/helpDesk/presentation/pages/pages.dart';

final routes = GoRouter(
  initialLocation: '/resource',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    ..._helpDeskPageRoutes,
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

/// Login pages
final _helpDeskPageRoutes = [
  GoRoute(
    path: '/help_desk',
    builder: (context, state) => const HelpDeskPage(),
  ),
  GoRoute(
    path: '/faq',
    builder: (context, state) => const FAQPage(),
  ),
  GoRoute(
    path: '/guideLinePage',
    builder: (context, state) => const GuideLinePage(),
  ),
  GoRoute(
    path: '/resource',
    builder: (context, state) => const ResourcesPage(),
  ),
];
