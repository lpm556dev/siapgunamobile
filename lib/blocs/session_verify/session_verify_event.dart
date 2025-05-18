part of 'session_verify_bloc.dart';

sealed class SessionVerifyEvent {}

class SessionVerifyLoad extends SessionVerifyEvent {}
class SessionVerifyReset extends SessionVerifyEvent {}