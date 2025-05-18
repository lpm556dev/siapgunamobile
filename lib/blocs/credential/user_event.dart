part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class LoadData extends UserEvent {
  const LoadData();

  @override
  List<Object> get props => [];
}