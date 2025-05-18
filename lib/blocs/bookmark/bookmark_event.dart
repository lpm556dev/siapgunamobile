part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  final int page;
  const BookmarkEvent({required this.page});

  @override
  List<Object> get props => [this.page];
}

final class AddBookmark extends BookmarkEvent {
  final String name;
  final int count;
  const AddBookmark({required super.page, required this.name, required this.count});
  @override
  List<Object> get props => [this.page, this.name, this.count];
}

final class RemoveBookmark extends BookmarkEvent {
  const RemoveBookmark({required super.page});
  @override
  List<Object> get props => [page];
}

class GetAllBookmark extends BookmarkEvent {
  const GetAllBookmark({super.page = 0});
}

class GetBookmark extends BookmarkEvent {
  const GetBookmark({required super.page});
  @override
  List<Object> get props => [page];
}

class GetLastBookmark extends BookmarkEvent {
  const GetLastBookmark({super.page = 0});
}
