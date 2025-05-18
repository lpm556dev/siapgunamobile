import 'package:bloc/bloc.dart';

part 'radio_button_event.dart';
part 'radio_button_state.dart';

class RadioButtonBloc extends Bloc<RadioButtonEvent, RadioButtonState> {
  RadioButtonBloc() : super(RadioButtonInitial(value: null)) {
    on<RadioButtonEvent>((event, emit) {
      emit(RadioButtonInitial(value: event.isValue));
    });
  }
}
