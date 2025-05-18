import 'package:bloc/bloc.dart';
import 'package:ssg_app/blocs/calendar/calendar_cubit.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(const CalendarState());

  void updateTanggal(DateTime tanggal) {
    emit(state.copyWith(tanggal: tanggal));
  }
}