import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/credential/user_bloc.dart';
import 'package:ssg_app/blocs/navbar/navigation_bloc.dart';
import 'package:ssg_app/blocs/notif/notif_bloc.dart';
import 'package:ssg_app/pages/notif_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(LoadData());
    debugPrint("state render");
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavigationBloc())],
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actionsPadding: EdgeInsets.symmetric(horizontal: 15),
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.lightColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image.asset("assets/images/app_bar_icon_only.png"),
              ),
              title: Container(
                clipBehavior: Clip.none,
                child: Text(
                  AppListComponent.appBarTitle[state.tabIndex],
                  style: AppTextStyle.title2,
                ),
              ),
              actions: [
                BlocBuilder<NotifBloc, NotifState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            AppHelpers.goTo(context, NotifPage(), true, true);
                          },
                          icon: Icon(
                            state is NotifEmpty
                                ? Icons.notifications_none
                                : Icons.notifications,
                            color: AppColors.lightColor,
                          ),
                        ),
                        state is NotifLoaded
                            ? Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 20,
                                  minHeight: 20,
                                ),
                                child: Center(
                                  child: Text(
                                    state.notifications.length.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                            : SizedBox.shrink(),
                      ],
                    );
                  },
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      child: Text(
                        state is UserCredentialisLoaded ? state.username[0] : '',
                      ),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.accentColor,
              currentIndex: state.tabIndex,
              selectedItemColor: AppColors.lightColor,
              unselectedItemColor: AppColors.primaryColor,
              onTap: (index) {
                context.read<NavigationBloc>().add(ChangeTab(index: index));
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Beranda",
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bookOpen),
                  label: "Qur'an",
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.fileCircleCheck),
                  label: "Mutaba'ah",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: "Berita",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Akun",
                ),
              ],
            ),
            body: AppListComponent.page[state.tabIndex],
          );
        },
      ),
    );
  }
}
