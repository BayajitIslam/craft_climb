import 'package:craft_climb/features/onboarding/data/repository/role_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:craft_climb/core/local_storage/local_storage.dart';
import 'package:craft_climb/features/onboarding/data/datasources/role_local_datasource.dart';
import 'package:craft_climb/features/onboarding/domain/repository/role_repository.dart';
import 'package:craft_climb/features/onboarding/domain/usecases/save_role_usecase.dart';
import 'package:craft_climb/features/onboarding/presentation/bloc/role_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Core - LocalStorage is likely a singleton
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage());

  // Data sources
  getIt.registerLazySingleton<RoleLocalDataSources>(
    () => RoleLocalDatasourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<RoleRepository>(
    () => RoleRepositoryImpl(roleLocalDataSources: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<SaveRoleUsecase>(
    () => SaveRoleUsecase(roleRepository: getIt()),
  );

  // Blocs (register as factory if they hold state that shouldn't be shared)
  getIt.registerFactory<RoleBloc>(() => RoleBloc(saveRoleUsecase: getIt()));
}
