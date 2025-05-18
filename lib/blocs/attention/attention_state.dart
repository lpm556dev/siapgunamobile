part of 'attention_bloc.dart';

sealed class AttentionState extends Equatable {
  const AttentionState();

  @override
  List<Object> get props => [];
}

final class AttentionInitial extends AttentionState {}

final class AttentionLoaded extends AttentionState {
  final List<AttentionModel> data;
  const AttentionLoaded({required this.data});
}
