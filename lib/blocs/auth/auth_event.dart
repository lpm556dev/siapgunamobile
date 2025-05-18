part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  final String phoneNumber;
  final String password;
  const AuthEvent(this.phoneNumber, this.password);

  @override
  List<Object> get props => [phoneNumber, password];
}

final class Submit extends AuthEvent {
  final BuildContext context;
  const Submit(super.phoneNumber, super.password, this.context);

  @override
  List<Object> get props => [phoneNumber, password, context];
}

final class InputChange extends AuthEvent {
  const InputChange(super.phoneNumber, super.password);

  @override
  List<Object> get props => [phoneNumber, password];
}
