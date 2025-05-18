part of 'session_verify_bloc.dart';

sealed class SessionVerifyState {}

final class SessionVerifyInitial extends SessionVerifyState {}

class SessionVerifyLoading extends SessionVerifyState {}
class SessionVerifyIsLoaded extends SessionVerifyState {
  final bool isSession;

  SessionVerifyIsLoaded({required this.isSession});
}
class SessionVerifyError extends SessionVerifyState {
  final String error;
  final bool isSession;

  SessionVerifyError({required this.isSession ,required this.error});
}