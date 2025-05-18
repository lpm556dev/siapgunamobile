part of 'check_box_bloc.dart';

@immutable
sealed class CheckBoxState {
  final bool value;
  const CheckBoxState({required this.value});
}

final class CheckBoxInitial extends CheckBoxState {
  const CheckBoxInitial({required super.value});
}
