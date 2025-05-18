import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/blocs/session_verify/session_verify_bloc.dart';
import 'package:ssg_app/pages/navigation_page.dart';
import 'package:ssg_app/pages/index_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionVerifyBloc, SessionVerifyState>(
      builder: (context, state) {
        print("current state $state");
        if (state is SessionVerifyLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SessionVerifyIsLoaded && state.isSession == true) {
          return NavigationPage();
        } else {
          return IndexPage();
        }
      },
    );
  }
}
