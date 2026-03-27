import 'package:craft_climb/core/errors/failure.dart';
import 'package:craft_climb/core/utils/debug_console.dart';
import 'package:craft_climb/features/onboarding/data/datasources/role_local_datasource.dart';
import 'package:craft_climb/features/onboarding/domain/repository/role_repository.dart';
import 'package:fpdart/fpdart.dart';

class RoleRepositoryImpl implements RoleRepository {
  final RoleLocalDataSources roleLocalDataSources;
  RoleRepositoryImpl({required this.roleLocalDataSources});

  @override
  Future<Either<Failure, String>> saveRole(String role) async {
    try {
      final result = await roleLocalDataSources.saveRole(role);
      DebugConsole.storage('Role: $result');
      return Right(result.toString());
    } catch (e) {
      DebugConsole.error('Error getting role: $e');
      return Left(Failure(e.toString()));
    }
  }
}
