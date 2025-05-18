import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';
import 'package:ssg_app/utils/app_helpers.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({required this.userRepository}) : super(AuthInitial('', '')) {
    on<InputChange>((event, emit) {
      emit(AuthInitial(event.phoneNumber, event.password));
    });

    on<Submit>((event, emit) async {
      emit(AuthInitial(event.phoneNumber, event.password));

      try {
        AppHelpers.inputValidation(
          event.phoneNumber.length < 12 && event.phoneNumber.isNotEmpty,
          () {
            throw Exception(
              "Nomor telepon harus terdiri dari 12 digit atau lebih!",
            );
          },
        );
        AppHelpers.inputValidation(
          event.password.length < 6 && event.password.isNotEmpty,
          () {
            throw Exception(
              "Password harus terdiri dari 6 karakter atau lebih!",
            );
          },
        );

        final userData = await userRepository.login(
          event.phoneNumber,
          event.password,
        );

        if (userData['user_verify']['isverified'] > 0) {
          emit(AuthSuccess());
        } else {
          print("userId in pendding ${userData['data']['id']}");
          emit(
            AuthPending(
              event.phoneNumber,
              event.password,
              userData['data']['id'],
            ),
          );
        }
      } catch (e) {
        String errorMessage = e.toString();
        errorMessage = errorMessage.replaceAll(
          'Exception: Network error: Exception: ',
          '',
        );
        errorMessage = errorMessage.replaceAll('Exception: ', '');
        emit(AuthError(errorMessage, event.phoneNumber, event.password));
      }
    });
  }
}
