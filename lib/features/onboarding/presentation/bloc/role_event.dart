part of 'role_bloc.dart';

@immutable
sealed class RoleEvent {}

class RoleSelectedEvent extends RoleEvent {
  final int index;
  RoleSelectedEvent(this.index);
}
