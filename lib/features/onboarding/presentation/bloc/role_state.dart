part of 'role_bloc.dart';

@immutable
sealed class RoleState {}

final class RoleInitial extends RoleState {}

class RoleLoaded extends RoleState {
  final int selectedIndex;
  RoleLoaded({required this.selectedIndex});
}

class RoleSuccess extends RoleState {
  final int selectedIndex;
  RoleSuccess({required this.selectedIndex});
}

class RoleError extends RoleState {
  final String message;
  RoleError({required this.message});
}
