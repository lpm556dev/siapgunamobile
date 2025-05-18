part of 'card_bloc.dart';

sealed class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object> get props => [];
}

final class LoadCardData extends CardEvent {
  const LoadCardData();

  @override
  List<Object> get props => [];
}