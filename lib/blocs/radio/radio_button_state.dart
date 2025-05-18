part of 'radio_button_bloc.dart';

sealed class RadioButtonState{
  final String? value;
  const RadioButtonState({required this.value});
}

final class RadioButtonInitial extends RadioButtonState {
  const RadioButtonInitial({required super.value});
}