part of 'radio_button_bloc.dart';

sealed class RadioButtonEvent {
  final String isValue;
  const RadioButtonEvent({required this.isValue});
}

class RadioButtonChanged extends RadioButtonEvent {
  const RadioButtonChanged({required super.isValue});
}
