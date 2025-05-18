part of 'qr_list_page_bloc.dart';

sealed class QrListPageEvent extends Equatable {
  const QrListPageEvent();

  @override
  List<Object> get props => [];
}

final class GetPageList extends QrListPageEvent {
  const GetPageList();

  @override
  List<Object> get props => [];
}