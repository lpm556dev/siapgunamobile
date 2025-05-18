import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_timer_event.dart';
part 'otp_timer_state.dart';

class OtpTimerBloc extends Bloc<OtpTimerEvent, OtpTimerState> {
static const int _maxDuration = 60;
  Timer? _timer;
  int _currentDuration = _maxDuration;

  OtpTimerBloc() : super(OtpTimerInitial(_maxDuration)) {
    on<OtpTimerStarted>(_onStarted);
    on<OtpTimerTicked>(_onTicked);
    on<OtpTimerReset>(_onReset);
  }

  void _onStarted(OtpTimerStarted event, Emitter<OtpTimerState> emit) {
    _currentDuration = _maxDuration;
    emit(OtpTimerRunInProgress(_currentDuration));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentDuration--;
      if (_currentDuration > 0) {
        add(OtpTimerTicked(_currentDuration));
      } else {
        add(OtpTimerTicked(0));
        _timer?.cancel();
      }
    });
  }

  void _onTicked(OtpTimerTicked event, Emitter<OtpTimerState> emit) {
    if (event.duration > 0) {
      emit(OtpTimerRunInProgress(event.duration));
    } else {
      emit(OtpTimerRunComplete());
    }
  }

  void _onReset(OtpTimerReset event, Emitter<OtpTimerState> emit) {
    _timer?.cancel();
    _currentDuration = _maxDuration;
    emit(OtpTimerInitial(_maxDuration));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
