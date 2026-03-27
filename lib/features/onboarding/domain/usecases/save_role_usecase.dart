import 'package:craft_climb/core/errors/failure.dart';
import 'package:craft_climb/core/usecase/usecase.dart';
import 'package:craft_climb/features/onboarding/domain/repository/role_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveRoleUsecase implements Usecase<String, RoleParams> {
  final RoleRepository roleRepository;
  SaveRoleUsecase({required this.roleRepository});
  @override
  Future<Either<Failure, String>> call(RoleParams params) async {
    return await roleRepository.saveRole(params.role);
  }
}

class RoleParams {
  final String role;
  RoleParams({required this.role});
}
