part of 'clock_bloc.dart';

sealed class ClockState extends Equatable {
  final String time;
  const ClockState(this.time);
  
  @override
  List<Object> get props => [time];
}

class ClockInitial extends ClockState {
  const ClockInitial(super.time);
}

class ClockRunInProgress extends ClockState {
  const ClockRunInProgress(super.time);
}