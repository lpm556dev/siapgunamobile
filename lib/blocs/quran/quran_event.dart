part of 'quran_bloc.dart';

sealed class QuranEvent extends Equatable {
  const QuranEvent();

  @override
  List<Object> get props => [];
}

final class GetAyah extends QuranEvent {
  final int noAyah;
  const GetAyah({required this.noAyah});

  @override
  List<Object> get props => [this.noAyah];
}

final class SearchAyah extends QuranEvent {
  final String keyword;
  const SearchAyah({required this.keyword});

  @override
  List<Object> get props => [this.keyword];
}

final class GetPage extends QuranEvent {
  final int noPage;
  const GetPage({required this.noPage});

  @override
  List<Object> get props => [this.noPage];
}

final class GetSurah extends QuranEvent {
  final int noSurah;
  const GetSurah({required this.noSurah});

  @override
  List<Object> get props => [this.noSurah];
}