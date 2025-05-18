part of 'font_size_bloc.dart';

sealed class FontSizeState extends Equatable {
  final double size = 12;
  final int index;
  final List<String> listMode = ['Small', 'Medium', 'Large'];
  FontSizeState(this.index);

  @override
  List<Object> get props => [this.listMode, this.index, this.size];
}

final class FontSizeInitial extends FontSizeState {
  FontSizeInitial(super.index);

  @override
  int get index => super.index;
}

final class FontSizeSmall extends FontSizeState {
  final double size = 12;
  FontSizeSmall(super.index);

  @override
  List<Object> get props => [this.size, this.index];
}

final class FontSizeMedium extends FontSizeState {
  final double size = 18;
  FontSizeMedium(super.index);

  @override
  List<Object> get props => [this.size, this.index];
}

final class FontSizeLarge extends FontSizeState {
  final double size = 24;
  FontSizeLarge(super.index);

  @override
  List<Object> get props => [this.size, this.index];
}
