part of 'qr_list_page_bloc.dart';

sealed class QrListPageState extends Equatable {
  const QrListPageState();

  @override
  List<Object> get props => [];
}

final class QrListPageInitial extends QrListPageState {}

final class QrListPageError extends QrListPageState {
  final String message;
  const QrListPageError({required this.message});

  @override
  List<Object> get props => [this.message];
}

final class PageListLoaded extends QrListPageState {
  final List<Tuple3<MQuranTData, MHalTData, MSuratTData>> result;
  const PageListLoaded(this.result);

  @override
  List<Object> get props => [this.result];
}
