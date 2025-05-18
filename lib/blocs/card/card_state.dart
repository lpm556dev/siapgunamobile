part of 'card_bloc.dart';

sealed class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

final class CardLoaded extends CardState {
  final Map<String, dynamic>? data;
  final String? name;
  const CardLoaded(this.data, this.name);

  @override
  List<Object> get props => [data ?? {}, name ?? ''];
}

final class CardError extends CardState {
  final String message;
  const CardError(this.message);

  @override
  List<Object> get props => [message];
}
