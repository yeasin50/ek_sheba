import 'package:ek_sheba/src/common/utils/api_config.dart';
import 'package:ek_sheba/src/features/IDSDP/domain/entities/project_details.dart';
import 'package:go_router/go_router.dart';

import 'features/Auth/presentation/pages/login_page.dart';
import 'features/IDSDP/presentation/pages/pages.dart';
import 'features/IDSDP/presentation/pages/project_details_page.dart';
import 'features/helpDesk/presentation/pages/faq_details_page.dart';
import 'features/helpDesk/presentation/pages/pages.dart';
import 'features/helpDesk/presentation/pages/pdf_view_page.dart';
import 'pspdf_test.dart';
import 'test_page.dart';

final routes = GoRouter(
  initialLocation: TestPDFPage.routeName,
  // '/login',
  routes: [
    GoRoute(
      path: TestPDFPage.routeName,
      builder: (context, state) => const DummyPDFTest(),
    ),
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
      name: DashBoardItemDetailsPage.routeName,
      path: DashBoardItemDetailsPage.routeName,
      builder: (context, state) {
        final itemTitle = state.extra as Map?;
        return DashBoardItemDetailsPage(itemTitle: itemTitle?['itemTitle'] ?? "in Preparation");
      },
    ),
    GoRoute(
        path: ProjectDetailsPage.routeName,
        builder: (context, state) {
          final ProjectDetails projectDetails = state.extra as ProjectDetails;
          return ProjectDetailsPage(
            projectDetails: projectDetails,
          );
        }
        // ProjectDetailsPage(projectDetails: state.extra as ProjectDetails),
        ),
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
    path: FAQDetailsPage.routeName,
    builder: (context, state) => FAQDetailsPage(
      uuid: state.extra as String? ?? "",
    ),
  ),
  GoRoute(
    path: '/guideLinePage',
    builder: (context, state) => const GuideLinePage(),
  ),
  GoRoute(
      path: '/pdf_view',
      builder: (context, state) {
        final data = state.extra as Map?;
        final pdfUrl =
            data?['url'] == null ? "http://africau.edu/images/default/sample.pdf" : APIInfo.baseUrl + data?['url'];
        final title = data?['title'] ?? "showing default being ";
        final String uid = data?['uid'] ?? "";

        return PDFViewPage(
          url: pdfUrl,
          title: title,
          uid: uid,
        );
      }),
  GoRoute(
    path: '/resource',
    builder: (context, state) => const ResourcesPage(),
  ),
  GoRoute(
    path: NoticePlanPage.routeName,
    builder: (context, state) => const NoticePlanPage(),
  ),
  GoRoute(
    path: HelpLinePage.routeName,
    builder: (context, state) => const HelpLinePage(),
  ),
];
