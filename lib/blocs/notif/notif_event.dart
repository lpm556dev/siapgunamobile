part of 'notif_bloc.dart';

sealed class NotifEvent {
  const NotifEvent();
}

final class LoadNotif extends NotifEvent {
  const LoadNotif();
}

final class RemoveNotif extends NotifEvent {
  final String id;
  const RemoveNotif({required this.id});
}

final class AddNotif extends NotifEvent {
  final NotifModel data;

  const AddNotif({required this.data});
}
