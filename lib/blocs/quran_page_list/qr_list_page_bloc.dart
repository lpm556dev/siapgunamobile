import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/local/quran_database.dart';
import 'package:ssg_app/data/repositories/quran_repo.dart';
import 'package:tuple/tuple.dart';

part 'qr_list_page_event.dart';
part 'qr_list_page_state.dart';

class QrListPageBloc extends Bloc<QrListPageEvent, QrListPageState> {
  final QuranRepository quranRepository;
  QrListPageBloc({required this.quranRepository}) : super(QrListPageInitial()) {
    on<GetPageList>(_onGetAllPage);
  }

  Future<void> _onGetAllPage(
    GetPageList event,
    Emitter<QrListPageState> emit,
  ) async {
    emit(QrListPageInitial());
    try {
      final List<Tuple3<MQuranTData, MHalTData, MSuratTData>> listData =
          await quranRepository.getListHal();
      emit(PageListLoaded(listData));
    } catch (e) {
      emit(QrListPageError(message: 'Gagal memuat data surah: $e'));
    }
  }
}
