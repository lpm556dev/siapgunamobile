import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadData>((event, emit) async {
      try {
        final String username = await UserRepository.getString("username");
        final int userId = await UserRepository.getInteger("userId");
        print("userId: $userId");
        final String role = await UserRepository.getString("role");

        if (username.isNotEmpty && userId > 0 && role.isNotEmpty) {
          emit(UserCredentialisLoaded(username, userId, role));
        } else {
          emit(UserCredentialError("No session user"));
        }
      } catch (e) {
        emit(UserCredentialError("Error loading user data: ${e.toString()}"));
      }
    });

    
  }
}
