import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class QuranMenuScreen extends StatelessWidget {
  const QuranMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(FontAwesomeIcons.book),
                    ),
                    Expanded(
                      child: Text("Halaman", overflow: TextOverflow.ellipsis,)
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.menu_book),
                    ),
                    Expanded(child: Text("Surat", overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.book),
                    ),
                    Expanded(
                      child: Text(
                        "Bookmark",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.label.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: Iterable.generate(
            AppListComponent.quranMenu.length, (index) {
            return AppListComponent.quranMenu[index];
          }).toList(),
        ),
      ),
    );
  }
}