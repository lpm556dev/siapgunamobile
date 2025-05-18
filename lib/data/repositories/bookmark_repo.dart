import 'package:ssg_app/data/dao/p_bookmark_dao.dart';
import 'package:ssg_app/data/local/app_database.dart';
import 'package:drift/drift.dart';

class BookmarkRepository {
  final PBookmarkDao _pBookmarkDao;

  BookmarkRepository(this._pBookmarkDao);

  Future<PBookmarkTData?> getBookmarkByPage(int page) async {
    return await _pBookmarkDao.getByPage(page);
  }

  Future<PBookmarkTData?> getLastBookmark() async {
    return await _pBookmarkDao.getCurrent();
  }

  Future<bool> addBookmark(int page, String nmSurah, int jmlAyah) async {
    try {
      final data = PBookmarkTCompanion(
        noHal: Value(page),
        nmSurat: Value(nmSurah),
        jmlAyat: Value(jmlAyah),
        createdAt: Value(DateTime.now()),
      );
      final result = await _pBookmarkDao.addNew(data);
      return result > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> removeBookmark(int page) async {
    try {
      final result = await _pBookmarkDao.removeByPage(page);
      return result > 0;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<PBookmarkTData>?> getAllHistories() async {
    try {
      final data = await _pBookmarkDao.getAll();
      return data;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
