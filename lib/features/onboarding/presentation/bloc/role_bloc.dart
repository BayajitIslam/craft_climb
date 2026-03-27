import 'package:craft_climb/features/onboarding/data/models/role_model.dart';
import 'package:craft_climb/features/onboarding/domain/usecases/save_role_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final SaveRoleUsecase saveRoleUsecase;
  RoleBloc({required this.saveRoleUsecase}) : super(RoleInitial()) {
    //Save role
    on<RoleSelectedEvent>(_onRoleSelectedSave);
  }

  //Save role
  Future<void> _onRoleSelectedSave(
    RoleSelectedEvent event,
    Emitter<RoleState> emit,
  ) async {
    try {
      emit(RoleLoaded(selectedIndex: event.index));
      final result = RoleModel.allRoles[event.index].role;
      await saveRoleUsecase(RoleParams(role: result));
      emit(RoleSuccess(selectedIndex: event.index));
    } catch (e) {
      emit(RoleError(message: e.toString()));
    }
  }
}
