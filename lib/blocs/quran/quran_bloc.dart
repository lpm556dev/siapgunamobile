import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ssg_app/data/local/quran_database.dart';
import 'package:ssg_app/data/repositories/quran_repo.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final QuranRepository quranRepository;
  QuranBloc({required this.quranRepository}) : super(QuranInitial()) {
    on<GetPage>(_onGetPage);
    on<GetAyah>(_onGetAyah);
    on<GetSurah>(_onGetSurah);
  }

  Future<void> _onGetPage(GetPage event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    try {
      final pages = await quranRepository.bacaHalaman(event.noPage);
      final ket = await quranRepository.getKetHal(event.noPage);
      emit(QuranPageLoaded(pages, ket));
    } catch (e) {
      emit(QuranLoadError('Gagal memuat halaman: $e'));
    }
  }

  Future<void> _onGetAyah(GetAyah event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    try {
      final ayat = await quranRepository.bacaSurat(event.noAyah);
      final ket = await quranRepository.listKetSurah(ayat[0].noSurat ?? 1);
      emit(QuranAyatLoaded(ayat, ket));
    } catch (e) {
      emit(QuranLoadError('Gagal memuat surat: $e'));
    }
  }

  Future<void> _onGetSurah(GetSurah event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    try {
      final ayat = await quranRepository.bacaSurat(event.noSurah);
      final ket = await quranRepository.listKetSurah(event.noSurah);
      emit(QuranAyatLoaded(ayat, ket));
    } catch (e) {
      emit(QuranLoadError('Gagal memuat surat: $e'));
    }
  }
}
