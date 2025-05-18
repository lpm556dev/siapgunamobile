part of 'check_box_bloc.dart';

@immutable
sealed class CheckBoxEvent {}

class ChangeValue extends CheckBoxEvent {
  final bool value;

  ChangeValue({required this.value});
}
