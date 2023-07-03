import 'package:get_it/get_it.dart';

import 'features/Auth/data/repositories/auth_repository.dart';
import 'features/Auth/presentation/bloc/auth_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => AuthRepositoryImpl());
  locator.registerLazySingleton(() => AuthBloc(locator.get<AuthRepositoryImpl>()));
  // locator.registerLazySingleton(() => AuthRepository());
  // locator.registerLazySingleton(() => AuthRemoteDataSource());
  // locator.registerLazySingleton(() => AuthLocalDataSource());
  // loc
}
