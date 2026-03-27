import 'package:craft_climb/core/local_storage/local_storage.dart';

abstract class RoleLocalDataSources {
  //Save role
  Future<String> saveRole(String role);
}

class RoleLocalDatasourceImpl implements RoleLocalDataSources {
  //Save role
  @override
  Future<String> saveRole(String role) async {
    await LocalStorage.setRole(role);
    return role;
  }
}
