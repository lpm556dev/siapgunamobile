import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/local/quran_database.dart';
import 'package:ssg_app/data/repositories/quran_repo.dart';

part 'qr_list_surat_event.dart';
part 'qr_list_surat_state.dart';

class QrListSuratBloc extends Bloc<QrListSuratEvent, QrListSuratState> {
  final QuranRepository quranRepository;
  QrListSuratBloc({required this.quranRepository}) : super(QrListSuratInitial()) {
    on<GetSurahList>(_onGetAllSurah);
  }

  Future<void> _onGetAllSurah(
    GetSurahList event,
    Emitter<QrListSuratState> emit,
  ) async {
    emit(QrListSuratInitial());
    try {
      final listData = await quranRepository.listSurah();
      emit(SurahListLoaded(listData));
    } catch (e) {
      emit(QrListSuratError(message: 'Gagal memuat data surah: $e'));
    }
  }
}
