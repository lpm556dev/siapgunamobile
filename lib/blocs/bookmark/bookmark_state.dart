part of 'bookmark_bloc.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

final class BookmarkInitial extends BookmarkState {
  const BookmarkInitial();
  @override
  List<Object> get props => [];
}

final class BookmarkListLoaded extends BookmarkState {
  final List<PBookmarkTData> listData;
  const BookmarkListLoaded({required this.listData});
  @override
  List<Object> get props => [listData];
}

final class BookmarkLoaded extends BookmarkState {
  final bool status;
  final int page;
  const BookmarkLoaded({required this.page, required this.status});
  @override
  List<Object> get props => [status, page];
}

final class BookmarkError extends BookmarkState {
  final String message;
  const BookmarkError({required this.message});
  @override
  List<Object> get props => [message];
}

final class BookmarkLastLoaded extends BookmarkState {
  final PBookmarkTData lastData;
  const BookmarkLastLoaded({required this.lastData});
  @override
  List<Object> get props => [lastData];
}
