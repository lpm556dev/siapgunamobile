part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  final UserModel? user;
  const RegisterEvent(this.user);

  @override
  List<Object> get props => [user ?? ''];
}

final class Submit extends RegisterEvent {
  const Submit(super.user);
  @override
  List<Object> get props => [user ?? ''];
}

final class InputChange extends RegisterEvent {
  const InputChange(super.user);
  @override
  List<Object> get props => [user ?? ''];
}