part of 'notif_bloc.dart';

sealed class NotifState {
  final int notifId;
  const NotifState({required this.notifId});
}

final class NotifInitial extends NotifState {
  const NotifInitial({required super.notifId});
}

final class NotifLoaded extends NotifState {
  final List<NotifModel> notifications;
  const NotifLoaded({required super.notifId ,required this.notifications});
}

final class NotifEmpty extends NotifState {
  final String message;
  const NotifEmpty({required super.notifId,required this.message});
}
