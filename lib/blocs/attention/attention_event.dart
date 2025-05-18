part of 'attention_bloc.dart';

sealed class AttentionEvent extends Equatable {
  const AttentionEvent();

  @override
  List<Object> get props => [];
}

final class LoadAttention extends AttentionEvent {
  const LoadAttention();

  @override
  List<Object> get props => [];
}