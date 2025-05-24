import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
import 'package:ssg_app/injection_container.dart';
import 'package:ssg_app/pages/root_page.dart';
import 'package:ssg_app/utils/app_helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await init();
  } catch (e) {
    debugPrint("Exception: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SessionVerifyBloc>()),
        BlocProvider(create: (context) => sl<NotifBloc>()..add(LoadNotif())),
        // BlocProvider(create: (context) => sl<TaskBloc>()..add(LoadTasks())),
        BlocProvider(create: (context) => sl<QuranBloc>()),
        BlocProvider(create: (context) => sl<BookmarkBloc>()),
        BlocProvider(
          create: (context) => sl<AttentionBloc>()..add(LoadAttention()),
        ),
        BlocProvider(create: (context) => sl<FontSizeBloc>()..add(InitSize())),
        BlocProvider(create: (context) => sl<CounterCubit>()),
        BlocProvider(
          create: (context) => sl<QrListPageBloc>()..add(GetPageList()),
        ),
        BlocProvider(
          create: (context) => sl<QrListSuratBloc>()..add(GetSurahList()),
        ),
        BlocProvider(create: (context) => sl<AuthBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => sl<ClockBloc>())
      ],
      child: MaterialApp(
        title: 'SantriSiap Mobile',
        debugShowCheckedModeBanner: bool.parse(dotenv.env['DEBUG_MODE']!),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Poppins'
        ),
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SessionVerifyBloc>().add(SessionVerifyLoad());
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => AppHelpers.goTo(context, RootPage(), true, false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 0),
              child: Image.asset(
                'assets/images/bg-splash-top.png',
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 250,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Image.asset('assets/images/splash-icon.png'),
            ),
            width: double.infinity,
          ),
          Container(
            child: Image.asset(
              'assets/images/bg-splash-bottom.png',
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: 290.5,
          ),
        ],
      ),
    );
  }
}
