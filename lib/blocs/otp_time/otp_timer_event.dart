part of 'otp_timer_bloc.dart';

sealed class OtpTimerEvent extends Equatable {
  const OtpTimerEvent();

  @override
  List<Object> get props => [];
}

class OtpTimerStarted extends OtpTimerEvent {}

class OtpTimerTicked extends OtpTimerEvent {
  final int duration;

  const OtpTimerTicked(this.duration);

  @override
  List<Object> get props => [duration];
}

class OtpTimerReset extends OtpTimerEvent {}
