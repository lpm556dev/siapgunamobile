part of 'clock_bloc.dart';

sealed class ClockEvent extends Equatable {
  const ClockEvent();

  @override
  List<Object> get props => [];
}

class StartClock extends ClockEvent {}

class StopClock extends ClockEvent {}

class ClockUpdated extends ClockEvent {
  final String time;

  const ClockUpdated(this.time);

  @override
  List<Object> get props => [time];
}
