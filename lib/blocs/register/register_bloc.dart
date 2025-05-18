import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';
import 'package:ssg_app/models/User.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  RegisterBloc({required this.userRepository}) : super(RegisterInitial(null)) {
    on<InputChange>((event, emit) {
      emit(RegisterInitial(event.user));
    });

    on<Submit>((event, emit) async {
      emit(RegisterInitial(event.user));
      try {
        final userData = await userRepository.register(
          event.user!,
        );

        if (userData['message'] == "Pendaftaran berhasil") {
          emit(RegisterSuccess(userData['message']));
        } else {
          throw Exception(userData['message']);
        }
      } catch (e) {
        print(e);
        emit(RegisterError("An error occurred: ${e.toString()}"));
      }
    });
  }
}
