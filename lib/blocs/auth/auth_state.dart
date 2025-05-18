part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final String phoneNumber;
  final String password;
  const AuthState(this.phoneNumber, this.password);

  @override
  List<Object> get props => [phoneNumber, password];
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.phoneNumber, super.password);

  @override
  List<Object> get props => [phoneNumber, password];
}

final class AuthError extends AuthState {
  final String message;
  const AuthError(this.message, super.phoneNumber, super.password);

  @override
  List<Object> get props => [message, phoneNumber, password];
}

final class AuthSuccess extends AuthState {
  const AuthSuccess([super.phoneNumber = '', super.password = '']);

  @override
  List<Object> get props => [];
}

final class AuthPending extends AuthState {
  final int id;
  const AuthPending(super.phoneNumber, super.password, this.id);

  @override
  List<Object> get props => [phoneNumber, password, id];
}
