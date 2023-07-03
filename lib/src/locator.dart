import 'package:ek_sheba/src/features/helpDesk/data/repositories/faq_repository_impl.dart';
import 'package:ek_sheba/src/features/helpDesk/presentation/bloc/faq/faq_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/Auth/data/repositories/auth_repository.dart';
import 'features/Auth/presentation/bloc/auth_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => AuthRepositoryImpl());
  locator.registerLazySingleton(() => AuthBloc(locator.get<AuthRepositoryImpl>()));
  locator.registerLazySingleton(() => FAQRepositoryImpl());
  locator.registerLazySingleton(() => FaqBloc(locator.get<FAQRepositoryImpl>()));
  // locator.registerLazySingleton(() => AuthRepository());
  // locator.registerLazySingleton(() => AuthRemoteDataSource());
  // locator.registerLazySingleton(() => AuthLocalDataSource());
  // loc
}
