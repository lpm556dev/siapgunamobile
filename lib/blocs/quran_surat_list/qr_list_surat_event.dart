part of 'qr_list_surat_bloc.dart';

sealed class QrListSuratEvent extends Equatable {
  const QrListSuratEvent();

  @override
  List<Object> get props => [];
}

final class GetSurahList extends QrListSuratEvent {
  const GetSurahList();

  @override
  List<Object> get props => [];
}
