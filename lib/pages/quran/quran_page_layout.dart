import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ssg_app/blocs/bookmark/bookmark_bloc.dart';
import 'package:ssg_app/blocs/counter_cubit/counter_cubit.dart';
import 'package:ssg_app/blocs/quran/quran_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';

class BodyPage extends StatelessWidget {
  BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (size, sizeState) {
          return BlocBuilder<QuranBloc, QuranState>(
            builder: (context, qrState) {
              if (qrState is QuranLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (qrState is QuranPageLoaded) {
                return Card(
                  color: AppColors.milkFrothColor,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          qrState.keterangan.length > 2
                              ? '${qrState.keterangan[0].nmSurat!} - ${qrState.keterangan[1].nmSurat2!} - ${qrState.keterangan[2].nmSurat2!}'
                              : (qrState.keterangan.length > 1
                                  ? '${qrState.keterangan[0].nmSurat!} - ${qrState.keterangan[1].nmSurat2!}'
                                  : qrState.keterangan[0].nmSurat.toString()),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListView(
                            children: [
                              if (qrState.pageData.contains(
                                    "begin in first ayat",
                                  ) &&
                                  qrState.keterangan[0].nmSurat != 'AL-FATIHAH')
                                Text(
                                  AppHelpers.bismillah,
                                  style: AppTextStyle.quran.copyWith(
                                    fontSize:
                                        sizeState.secondCount! < 26
                                            ? sizeState.secondCount
                                            : 26,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              Text(
                                qrState.pageData[0],
                                style: AppTextStyle.quran.copyWith(
                                  fontSize: sizeState.secondCount,
                                  wordSpacing: 0.5,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                              ),
                              if (qrState.pageData.length > 1 &&
                                  qrState.pageData[1] != "begin in first ayat")
                                Text(
                                  AppHelpers.bismillah,
                                  style: AppTextStyle.quran.copyWith(
                                    fontSize:
                                        sizeState.secondCount! < 26
                                            ? sizeState.secondCount
                                            : 26,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              if (qrState.pageData.length > 1 &&
                                  qrState.pageData[1] != "begin in first ayat")
                                Text(
                                  qrState.pageData[1],
                                  style: AppTextStyle.quran.copyWith(
                                    fontSize: sizeState.secondCount,
                                  ),
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                ),
                              if (qrState.pageData.length > 2 &&
                                  qrState.pageData[2] != "begin in first ayat")
                                Text(
                                  AppHelpers.bismillah,
                                  style: AppTextStyle.quran.copyWith(
                                    fontSize:
                                        sizeState.secondCount! < 26
                                            ? sizeState.secondCount
                                            : 26,
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              if (qrState.pageData.length > 2 &&
                                  qrState.pageData[2] != "begin in first ayat")
                                Text(
                                  qrState.pageData[2],
                                  style: AppTextStyle.quran.copyWith(
                                    fontSize: sizeState.secondCount,
                                  ),
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton.filled(
                                onPressed: () {
                                  size.read<CounterCubit>().secondIncrement();
                                },
                                icon: Icon(Icons.zoom_in),
                              ),
                              IconButton.filled(
                                onPressed: () {
                                  size.read<CounterCubit>().secondDecrement();
                                },
                                icon: Icon(Icons.zoom_out),
                              ),
                              BlocBuilder<BookmarkBloc, BookmarkState>(
                                builder: (context, state) {
                                  if (state is BookmarkLoaded) {
                                    return IconButton.filled(
                                      onPressed: () {
                                        print(state.page);
                                        if (state.status) {
                                          context.read<BookmarkBloc>().add(
                                            RemoveBookmark(page: state.page),
                                          );
                                        } else {
                                          context.read<BookmarkBloc>().add(
                                            AddBookmark(
                                              page: state.page,
                                              name:
                                                  qrState.keterangan[0].nmSurat
                                                      .toString(),
                                              count:
                                                  qrState
                                                      .keterangan[0]
                                                      .jmlAyat!,
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        state.status
                                            ? FontAwesomeIcons.solidBookmark
                                            : FontAwesomeIcons.bookmark,
                                      ),
                                    );
                                  }
                                  return IconButton.filled(
                                    onPressed: () {
                                      context.read<BookmarkBloc>().add(
                                        AddBookmark(
                                          page: sizeState.count,
                                          name:
                                              qrState.keterangan[0].nmSurat
                                                  .toString(),
                                          count: qrState.keterangan[0].jmlAyat!,
                                        ),
                                      );
                                    },
                                    icon: Icon(FontAwesomeIcons.bookmark),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizeState.count < 604
                                ? IconButton(
                                  onPressed: () {
                                    context.read<CounterCubit>().increment();
                                    if (sizeState.count < 604) {
                                      context.read<QuranBloc>().add(
                                        GetPage(noPage: sizeState.count + 1),
                                      );
                                    }
                                    context.read<BookmarkBloc>().add(
                                      GetBookmark(page: sizeState.count + 1),
                                    );
                                  },
                                  icon: const Icon(Icons.chevron_left),
                                )
                                : SizedBox(width: 50),
                            Text('Page ${sizeState.count}'),
                            sizeState.count > 1
                                ? IconButton(
                                  onPressed: () {
                                    size.read<CounterCubit>().decrement();
                                    if (sizeState.count > 1) {
                                      context.read<QuranBloc>().add(
                                        GetPage(noPage: sizeState.count - 1),
                                      );
                                    }
                                    context.read<BookmarkBloc>().add(
                                      GetBookmark(page: sizeState.count - 1),
                                    );
                                  },
                                  icon: const Icon(Icons.chevron_right),
                                )
                                : SizedBox(width: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else if (qrState is QuranAyatLoaded) {
                context.read<QuranBloc>().add(GetPage(noPage: 1));
                return Center(child: CircularProgressIndicator());
              } else if (qrState is QuranLoadError) {
                return Text(qrState.message);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 38,
              width: 350,
              color: Colors.transparent, // latar bantu
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 604,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                reverse: true,
                itemBuilder: (_, i) {
                  final no = i + 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(38, 16),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        context.read<BookmarkBloc>().add(GetBookmark(page: no));
                        context.read<QuranBloc>().add(GetPage(noPage: no));
                        context.read<CounterCubit>().change(no);
                      },
                      child: Text(no.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
