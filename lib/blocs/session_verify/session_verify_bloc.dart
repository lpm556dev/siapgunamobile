import 'package:bloc/bloc.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';

part 'session_verify_event.dart';
part 'session_verify_state.dart';

class SessionVerifyBloc extends Bloc<SessionVerifyEvent, SessionVerifyState> {
  SessionVerifyBloc() : super(SessionVerifyInitial()) {
    on<SessionVerifyLoad>((event, emit) async {
      if (state is SessionVerifyInitial) {
        try {
          final int sessionUser = await UserRepository.getInteger("userId");
          final bool isCurrentSession = sessionUser != 0;
          
          if (isCurrentSession) {
            emit(SessionVerifyIsLoaded(isSession: isCurrentSession));
          } else {
            emit(
              SessionVerifyError(
                isSession: isCurrentSession,
                error: "User ID not found",
              ),
            );
          }
        } catch (e) {
          emit(
            SessionVerifyError(
              isSession: false,
              error: e.toString(),
            ),
          );
        }
      }
    });
  }
}
