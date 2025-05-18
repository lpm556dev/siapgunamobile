part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserCredentialisLoaded extends UserState {
  final String username;
  final int userId;
  final String role;
  const UserCredentialisLoaded(this.username, this.userId, this.role);

  @override
  List<Object> get props => [username, userId, role];
}

final class UserCredentialError extends UserState {
  final String message;
  const UserCredentialError(this.message);

  @override
  List<Object> get props => [message];
}
