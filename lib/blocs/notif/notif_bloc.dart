import 'package:bloc/bloc.dart';
import 'package:ssg_app/models/Notif.dart';
import 'package:ssg_app/data/repositories/notif_repo.dart';

part 'notif_event.dart';
part 'notif_state.dart';

class NotifBloc extends Bloc<NotifEvent, NotifState> {
  final NotifRepository repository;

  NotifBloc({required this.repository}) : super(NotifInitial(notifId: 0)) {
    on<LoadNotif>((event, emit) async {
      final data = await repository.fetchNotifications();
      if (data.length == 0) {
        emit(NotifEmpty(notifId: state.notifId, message: "No Attention"));
      } else {
        emit(NotifLoaded(notifId: state.notifId, notifications: data));
      }
    });
    on<RemoveNotif>((event, emit) async {
      if (state is NotifLoaded) {
        repository.removeNotification(event.id);
        final updatedData = await repository.fetchNotifications();
        if (updatedData.isEmpty) {
          emit(NotifEmpty(notifId: state.notifId, message: "No notification"));
        }else{
          emit(NotifLoaded(notifId: state.notifId, notifications: updatedData));
        }
      }
    });
    on<AddNotif>((event, emit) async {
      await repository.addNotification(event.data);
      final data = await repository.fetchNotifications();
      emit(NotifLoaded(notifId: state.notifId + 1, notifications: data));
    });
  }
}
