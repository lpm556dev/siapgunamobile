import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/bookmark/bookmark_bloc.dart';
import 'package:ssg_app/data/dao/p_bookmark_dao.dart';
import 'package:ssg_app/data/local/app_database.dart';
import 'package:ssg_app/data/repositories/bookmark_repo.dart';
import 'package:ssg_app/pages/quran/quran_page.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_card.dart';
import 'package:ssg_app/widgets/app_list_component.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (bmCtx) => BookmarkBloc(
            bookmarkRepository: BookmarkRepository(PBookmarkDao(AppDatabase())),
          )..add(GetAllBookmark()),
      child: Scaffold(
        body: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (bmCtx, state) {
            if (state is BookmarkError) {
              return Container(
                child: Center(
                  child: Text(
                    state.message,
                    style: AppTextStyle.subtitle.copyWith(
                      color: AppColors.darkColor,
                    ),
                  ),
                ),
              );
            } else if (state is BookmarkListLoaded) {
              return Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listData.length,
                      itemBuilder: (context, index) {
                        final bookmark = state.listData[index];
                        return Dismissible(
                          key: Key(bookmark.noHal.toString()),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) {
                            bmCtx.read<BookmarkBloc>().add(
                              RemoveBookmark(page: bookmark.noHal),
                            );
                            bmCtx.read<BookmarkBloc>().add(GetAllBookmark());
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
                          child: AppCard.fill(
                            AppListComponent.ListMenu(
                              "Halaman ${bookmark.noHal} - ${AppHelpers.toCapitalize(bookmark.nmSurat.toString())}",
                              "Jumlah Ayat : ${bookmark.jmlAyat}",
                              () {
                                AppHelpers.goTo(
                                  context,
                                  QuranPage(page: bookmark.noHal),
                                  true
                                );
                              },
                              Icon(FontAwesomeIcons.bookBookmark),
                              Icon(Icons.chevron_right),
                              null,
                              true
                            ),
                            AppColors.butterColor
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Text("~Silahkan geser kesamping untuk menghapus!~", style: AppTextStyle.bodyText.copyWith(color: AppColors.dangerColor),),
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(child: Text("No Bookmark"));
          },
        ),
      ),
    );
  }
}
