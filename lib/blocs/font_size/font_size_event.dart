part of 'font_size_bloc.dart';

sealed class FontSizeEvent extends Equatable {
  const FontSizeEvent();

  @override
  List<Object> get props => [];
}

final class ChangeSize extends FontSizeEvent {
  final String mode;
  final int index;
  const ChangeSize(this.mode, this.index);

  @override
  List<Object> get props => [this.mode, this.index];
}

final class InitSize extends FontSizeEvent {
  final int initIndex;
  const InitSize([this.initIndex = 0]);

  @override
  List<Object> get props => [this.initIndex];
}
