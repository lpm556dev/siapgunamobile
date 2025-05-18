part of 'otp_timer_bloc.dart';

sealed class OtpTimerState extends Equatable {
  final int duration;
  const OtpTimerState(this.duration);
  
  @override
  List<Object> get props => [duration];
}

class OtpTimerInitial extends OtpTimerState {
  const OtpTimerInitial(super.duration);
}

class OtpTimerRunInProgress extends OtpTimerState {
  const OtpTimerRunInProgress(super.duration);
}

class OtpTimerRunComplete extends OtpTimerState {
  const OtpTimerRunComplete([super.duration = 0]);
}