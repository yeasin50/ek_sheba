import 'package:ek_sheba/src/features/IDSDP/data/repositories/comment_repo_impl.dart';
import 'package:get_it/get_it.dart';

import 'features/Auth/data/repositories/auth_repository.dart';
import 'features/Auth/presentation/bloc/auth_bloc.dart';
import 'features/IDSDP/data/repositories/approved_project_repo_impl.dart';
import 'features/IDSDP/data/repositories/dashboard_projects_repo_impl.dart';
import 'features/IDSDP/data/repositories/unapproved_project_repo_impl.dart';
import 'features/IDSDP/presentation/bloc/agency_and_ministry__name/agency_and_ministry_name_bloc.dart';
import 'features/IDSDP/presentation/bloc/idsdp_bloc.dart';
import 'features/helpDesk/data/repositories/faq_repository_impl.dart';
import 'features/helpDesk/data/repositories/guideline_repository_impl.dart';
import 'features/helpDesk/data/repositories/helpline_repo_impl.dart';
import 'features/helpDesk/data/repositories/notice_repository_impl.dart';
import 'features/helpDesk/data/repositories/resouce_repository_impl.dart';
import 'features/helpDesk/presentation/bloc/faq/faq_bloc.dart';
import 'features/helpDesk/presentation/bloc/guideline/guideline_bloc.dart';
import 'features/helpDesk/presentation/bloc/notice_plan/notice_plan_bloc.dart';
import 'features/helpDesk/presentation/bloc/resource/resource_bloc.dart';
import 'features/html_pdf_dashboard/auth/auth_hanlder.dart';
import 'features/pdf/data/repositories/pdf_repo_impl.dart';
import 'features/pdf_other_information/data/repositories/pdf_other_inforomation_impl.dart';

export 'features/IDSDP/data/repositories/approved_project_repo_impl.dart';
export 'features/IDSDP/data/repositories/unapproved_project_repo_impl.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => AuthRepositoryImpl());
  locator.registerLazySingleton(() => AuthBloc(locator.get<AuthRepositoryImpl>()));

  locator.registerLazySingleton(() => FAQRepositoryImpl());
  locator.registerLazySingleton(() => FaqBloc(locator.get<FAQRepositoryImpl>()));

  locator.registerLazySingleton(() => GuidelineRepositoryImpl());
  locator.registerLazySingleton(() => GuidelineBloc(locator.get<GuidelineRepositoryImpl>()));

  locator.registerLazySingleton(() => ResourceRepositoryImpl());
  locator.registerLazySingleton(() => ResourceBloc(locator.get<ResourceRepositoryImpl>()));

  locator.registerLazySingleton(() => HelplineRepositoryImpl());

  locator.registerLazySingleton(() => NoticeRepositoryImpl());
  locator.registerLazySingleton(() => NoticePlanBloc(locator.get<NoticeRepositoryImpl>()));

  locator.registerLazySingleton(() => DashboardProjectRepoImpl(
        approvedRepo: DashboardApprovedProjectRepoImpl(),
        unApprovedRepo: DashboardUnapprovedProjectRepoImpl(),
      ));

  locator.registerLazySingleton(() => IdsdpBloc());
  locator.registerLazySingleton(() => AgencyAndMinistryNameBloc());

  locator.registerLazySingleton(() => PDfHandler());
  locator.registerLazySingleton(() => PdfRepositoryImpl());

  locator.registerLazySingleton(() => CommentRepoImpl());

  locator.registerLazySingleton(() => PdfOtherInfoImpl());
}
