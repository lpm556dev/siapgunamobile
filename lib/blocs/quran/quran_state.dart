part of 'quran_bloc.dart';

sealed class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

final class QuranInitial extends QuranState {
  const QuranInitial();
}

final class QuranLoading extends QuranState {
  const QuranLoading();
}

final class QuranAyatLoaded extends QuranState {
  final List<MSuratTData> ayat;
  final List<MQuranTData> ket;
  const QuranAyatLoaded(this.ayat, this.ket);

  @override
  List<Object> get props => [this.ayat, this.ket];
}

final class SearchResult extends QuranState {
  final List<MSuratTData> result;
  const SearchResult(this.result);

  @override
  List<Object> get props => [this.result];
}

final class QuranPageLoaded extends QuranState {
  final List<String> pageData;
  final List<MQuranTData> keterangan;
  const QuranPageLoaded(this.pageData, this.keterangan);

  @override
  List<Object> get props => [this.pageData, this.keterangan];
}

final class QuranLoadError extends QuranState {
  final String message;
  const QuranLoadError(this.message);

  @override
  List<Object> get props => [this.message];
}