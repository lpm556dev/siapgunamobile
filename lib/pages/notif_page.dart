import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ssg_app/blocs/notif/notif_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_list_component.dart';
import 'package:ssg_app/widgets/test_alert.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.lightColor,
        title: Text("Notifikasi"),
        titleTextStyle: AppTextStyle.title2.copyWith(
          color: AppColors.lightColor,
        ),
        actions: [
          BlocBuilder<NotifBloc, NotifState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return TestAlert(
                        id: state.notifId,
                      );
                    },
                  );
                },
                icon: Icon(Icons.notification_add),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<NotifBloc, NotifState>(
        builder: (context, state) {
          if (state is NotifEmpty) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyle.subtitle.copyWith(
                  color: AppColors.darkColor,
                ),
              ),
            );
          } else if (state is NotifLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final notif = state.notifications[index];
                return Dismissible(
                  key: Key(notif.id),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    context.read<NotifBloc>().add(RemoveNotif(id: notif.id));
                  },
                  background: Container(
                    color: AppColors.dangerColor,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: AppColors.lightColor),
                  ),
                  secondaryBackground: Container(
                    color: AppColors.dangerColor,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: AppColors.lightColor),
                  ),
                  child: AppListComponent.ListMenu(
                    notif.title,
                    notif.message,
                    () {},
                    null,
                    null,
                    CircleAvatar(child: Icon(Icons.notifications_active)),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
