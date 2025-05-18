part of 'counter_cubit.dart';

@immutable
sealed class CounterState {
  final int count;
  final double? secondCount;
  const CounterState({required this.count, this.secondCount});
}

final class CounterInitial extends CounterState {
  const CounterInitial({required super.count, super.secondCount});
}

final class CounterIncrement extends CounterState {
  const CounterIncrement({required super.count, super.secondCount});
}

final class CounterDecrement extends CounterState {
  const CounterDecrement({required super.count, super.secondCount});
}

final class CounterChange extends CounterState {
  const CounterChange({required super.count, super.secondCount});
}
