import 'package:craft_climb/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class RoleRepository {

  //Save role
  Future<Either<Failure, String>> saveRole(String role);
}
