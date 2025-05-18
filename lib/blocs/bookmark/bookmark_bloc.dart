import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/local/app_database.dart';
import 'package:ssg_app/data/repositories/bookmark_repo.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkRepository bookmarkRepository;

  BookmarkBloc({required this.bookmarkRepository}) : super(BookmarkInitial()) {
    on<GetBookmark>(_getBookmark);
    on<AddBookmark>(_addBookmark);
    on<RemoveBookmark>(_removeBookmark);
    on<GetAllBookmark>(_getBookmarkHistory);
    on<GetLastBookmark>(_getBookmarkLast);
  }

  Future<void> _getBookmark(
    GetBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    final bookmark = await bookmarkRepository.getBookmarkByPage(event.page);
    if (bookmark != null) {
      emit(BookmarkLoaded(status: true, page: event.page));
    } else {
      emit(BookmarkLoaded(status: false, page: event.page));
    }
  }

  Future<void> _addBookmark(
    AddBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    final success = await bookmarkRepository.addBookmark(event.page, event.name, event.count);
    if (success) {
      emit(BookmarkLoaded(status: true, page: event.page));
    } else {
      emit(BookmarkError(message: "Gagal menambahkan bookmark"));
    }
  }

  Future<void> _removeBookmark(
    RemoveBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    final success = await bookmarkRepository.removeBookmark(event.page);
    if (success) {
      emit(BookmarkLoaded(status: false, page: event.page));
    } else {
      emit(BookmarkError(message: "Gagal menghapus bookmark"));
    }
  }

  Future<void> _getBookmarkHistory(
    GetAllBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    final List<PBookmarkTData> bookmarkHistories = await bookmarkRepository.getAllHistories() ?? [];
    if (bookmarkHistories.isNotEmpty) {
      emit(BookmarkListLoaded(listData: bookmarkHistories));
    } else {
      emit(BookmarkError(message: "No bookmark saved"));
    }
  }

  Future<void> _getBookmarkLast(
    GetLastBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    try {
      final bookmark = await bookmarkRepository.getLastBookmark();
      if (bookmark != null) {
        emit(BookmarkLastLoaded(lastData: bookmark));
      } else {
        emit(BookmarkError(message: "No bookmark saved"));
      }
    } catch (e) {
      emit(BookmarkError(message: "Error getting last bookmark: ${e.toString()}"));
    }
  }
}
