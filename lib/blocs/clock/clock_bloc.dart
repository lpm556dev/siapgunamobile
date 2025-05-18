import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'clock_event.dart';
part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  Timer? _timer;

  ClockBloc() : super(ClockInitial(_formattedTime())) {
    on<StartClock>(_onStartClock);
    on<StopClock>(_onStopClock);
    on<ClockUpdated>(_onClockUpdated);
  }

  static String _formattedTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  void _onStartClock(StartClock event, Emitter<ClockState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(ClockUpdated(_formattedTime()));
    });
  }

  void _onStopClock(StopClock event, Emitter<ClockState> emit) {
    _timer?.cancel();
  }

  void _onClockUpdated(ClockUpdated event, Emitter<ClockState> emit) {
    emit(ClockRunInProgress(event.time));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
