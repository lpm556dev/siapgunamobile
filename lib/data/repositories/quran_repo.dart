import 'package:ssg_app/data/local/quran_database.dart';
import 'package:ssg_app/data/dao/hal_dao.dart';
import 'package:ssg_app/data/dao/surat_dao.dart';
import 'package:tuple/tuple.dart';

class QuranRepository {
  final SuratDao suratDao;
  final HalDao halDao;
  QuranRepository(this.suratDao, this.halDao);

  Future<List<MSuratTData>> bacaSurat(int nomor) async =>
      suratDao.getSurat(nomor);

  Future<List<String>> bacaHalaman(int nomor) => halDao.pageBlocksAsText(nomor);

  Future<List<MQuranTData>> getKetHal(int noHal) =>
      halDao.fetchKeteranganHal(noHal);

  Future<List<MQuranTData>> listSurah() => suratDao.getAllSurah();

  Future<List<MQuranTData>> listKetSurah(int noSurat) =>
      suratDao.fetchKeteranganSurah(noSurat);

  Future<List<Tuple3<MQuranTData, MHalTData, MSuratTData>>> getListHal() =>
      halDao.fetchUniquePerHalaman();
}
