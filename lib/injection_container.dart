import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ssg_app/blocs/attention/attention_bloc.dart';
import 'package:ssg_app/blocs/auth/auth_bloc.dart';
import 'package:ssg_app/blocs/bookmark/bookmark_bloc.dart';
import 'package:ssg_app/blocs/clock/clock_bloc.dart';
import 'package:ssg_app/blocs/counter_cubit/counter_cubit.dart';
import 'package:ssg_app/blocs/credential/user_bloc.dart';
import 'package:ssg_app/blocs/font_size/font_size_bloc.dart';
import 'package:ssg_app/blocs/notif/notif_bloc.dart';
import 'package:ssg_app/blocs/quran/quran_bloc.dart';
import 'package:ssg_app/blocs/quran_page_list/qr_list_page_bloc.dart';
import 'package:ssg_app/blocs/quran_surat_list/qr_list_surat_bloc.dart';
import 'package:ssg_app/blocs/session_verify/session_verify_bloc.dart';
// import 'package:ssg_app/blocs/task/task_bloc.dart';
import 'package:ssg_app/data/local/app_database.dart';
import 'package:ssg_app/data/dao/hal_dao.dart';
import 'package:ssg_app/data/dao/p_bookmark_dao.dart';
import 'package:ssg_app/data/dao/surat_dao.dart';
import 'package:ssg_app/data/local/quran_database.dart';
import 'package:ssg_app/data/repositories/attent_repo.dart';
import 'package:ssg_app/data/repositories/bookmark_repo.dart';
import 'package:ssg_app/data/repositories/notif_repo.dart';
import 'package:ssg_app/data/repositories/quran_repo.dart';
import 'package:ssg_app/data/repositories/task_repo.dart';
import 'package:ssg_app/data/repositories/user_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: '.env');

  //notification init
  sl.registerLazySingleton<NotifRepository>(() => NotifRepository());
  await sl<NotifRepository>().initNotification();

  //db
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<QuranDatabase>(() => QuranDatabase());

  //dao
  sl.registerLazySingleton<SuratDao>(() => SuratDao(sl()));
  sl.registerLazySingleton<HalDao>(() => HalDao(sl()));
  sl.registerLazySingleton<PBookmarkDao>(() => PBookmarkDao(sl()));

  //repository
  sl.registerLazySingleton<QuranRepository>(() => QuranRepository(sl(), sl()));
  sl.registerLazySingleton<BookmarkRepository>(() => BookmarkRepository(sl()));
  sl.registerLazySingleton<TaskRepository>(() => TaskRepository());
  sl.registerLazySingleton<AttentRepository>(() => AttentRepository());
  sl.registerLazySingleton<UserRepository>(() => UserRepository());

  //bloc
  sl.registerFactory(() => AuthBloc(userRepository: sl()));
  sl.registerFactory(() => QuranBloc(quranRepository: sl()));
  sl.registerFactory(() => BookmarkBloc(bookmarkRepository: sl()));
  sl.registerFactory(() => QrListPageBloc(quranRepository: sl()));
  sl.registerFactory(() => QrListSuratBloc(quranRepository: sl()));
  sl.registerFactory(() => NotifBloc(repository: sl()));
  // sl.registerFactory(() => TaskBloc(repository: sl()));
  sl.registerFactory(() => AttentionBloc(attentRepository: sl()));
  sl.registerFactory(
    () => CounterCubit(countInit: 1, limit: 604, second: 20, limitSecond: 30),
  );
  sl.registerFactory(() => FontSizeBloc());
  sl.registerFactory(() => SessionVerifyBloc());
  sl.registerFactory(() => UserBloc());
  sl.registerFactory(() => ClockBloc());
}
