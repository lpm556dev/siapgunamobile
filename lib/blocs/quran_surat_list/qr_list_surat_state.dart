part of 'qr_list_surat_bloc.dart';

sealed class QrListSuratState extends Equatable {
  const QrListSuratState();

  @override
  List<Object> get props => [];
}

final class QrListSuratInitial extends QrListSuratState {}

final class SurahListLoaded extends QrListSuratState {
  final List<MQuranTData> result;
  const SurahListLoaded(this.result);

  @override
  List<Object> get props => [this.result];
}

final class QrListSuratError extends QrListSuratState {
  final String message;
  const QrListSuratError({required this.message});

  @override
  List<Object> get props => [message];
}
