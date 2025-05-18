import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final int limit;
  final int countInit;
  final double? second;
  final double? limitSecond;
  CounterCubit({
    required this.limit,
    required this.countInit,
    this.second,
    this.limitSecond,
  }) : super(CounterInitial(count: countInit, secondCount: second));

  void increment() {
    emit(
      CounterIncrement(
        count: state.count < limit ? state.count + 1 : state.count,
        secondCount: state.secondCount ?? null
      ),
    );
  }

  void secondIncrement() {
    emit(
      CounterIncrement(
        count: state.count,
        secondCount: state.secondCount! < limitSecond! ? state.secondCount! + 1 : state.secondCount,
      ),
    );
  }

  void decrement() {
    emit(
      CounterDecrement(
        count: state.count > countInit ? state.count - 1 : state.count,
        secondCount: state.secondCount ?? null
      ),
    );
  }

  void secondDecrement() {
    emit(
      CounterDecrement(
        count: state.count, 
        secondCount: state.secondCount! > second! ? state.secondCount! - 1 : state.secondCount
      ),
    );
  }

  void init() {
    emit(CounterInitial(count: state.count, secondCount: state.secondCount));
  }

  void change(int step) {
    emit(CounterChange(count: step, secondCount: state.secondCount));
  }

  void secondChange(double index) {
    emit(CounterChange(count: state.count, secondCount: index));
  }
}
