import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_event.dart';
part 'check_box_state.dart';

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  final bool isChecked;

  CheckBoxBloc({required this.isChecked}) : super(CheckBoxInitial(value: isChecked)) {
    on<ChangeValue>((event, emit) {
      emit(CheckBoxInitial(value: event.value));
    });
  }
}
