import 'package:bloc/bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial(tabIndex: 0)) {
    on<ChangeTab>((event, emit) {
      emit(NavigationInitial(tabIndex: event.index));
    });
  }
}
