import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'font_size_event.dart';
part 'font_size_state.dart';

class FontSizeBloc extends Bloc<FontSizeEvent, FontSizeState> {
  FontSizeBloc() : super(FontSizeInitial(0)) {
    on<ChangeSize>((event, emit) {
      emit(FontSizeInitial(0));
      if (event.mode == 'Small') {
        emit(FontSizeSmall(0));
      } else if (event.mode == 'Medium') {
        emit(FontSizeMedium(1));
      } else {
        emit(FontSizeLarge(2));
      }
    });
    on<InitSize>((event, emit) {
      emit(FontSizeInitial(event.initIndex));
    });
  }
}
