import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';
import 'features/IDSDP/presentation/pages/faq_page.dart';
import 'features/IDSDP/presentation/pages/guidline_page.dart';
import 'features/IDSDP/presentation/pages/pages.dart';

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
