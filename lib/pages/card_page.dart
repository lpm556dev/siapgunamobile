import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ssg_app/blocs/card/card_bloc.dart';
import 'package:ssg_app/utils/app_colors.dart';
import 'package:ssg_app/utils/app_helpers.dart';
import 'package:ssg_app/utils/app_text_style.dart';
import 'package:ssg_app/widgets/app_alert.dart';

class CardPage extends StatelessWidget {
  CardPage({super.key});

  final GestureFlipCardController _controller = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    context.read<CardBloc>().add(LoadCardData());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        foregroundColor: AppColors.lightColor,
        title: Text("Kartu Peserta"),
        titleTextStyle: AppTextStyle.title2.copyWith(
          color: AppColors.lightColor,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CardBloc, CardState>(
              builder: (context, cardState) {
                return GestureFlipCard(
                  controller: _controller,
                  enableController: true,
                  animationDuration: const Duration(milliseconds: 300),
                  axis: FlipAxis.vertical,
                  frontWidget: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: AppColors.darkColor,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/member-card-front.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 12,
                          child:
                              cardState is CardLoaded &&
                                      cardState.data != null &&
                                      cardState
                                              .data!['data']['qrcode_text'][0] ==
                                          'B'
                                  ? Container(
                                    width: 90,
                                    height: 90,
                                    color: AppColors.lightColor,
                                    child: Image.asset(
                                      "assets/images/akhwat-profile.png",
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                  : Container(
                                    width: 90,
                                    height: 90,
                                    color: AppColors.lightColor,
                                    child: Image.asset(
                                      "assets/images/ikhwan-profile.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                        ),
                        Positioned(
                          top: 102,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.only(left: 20),
                            color: AppColors.lightColor,
                            width: 250,
                            height: 30,
                          ),
                        ),
                        Positioned(
                          top: 75,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            color: AppColors.lightColor,
                            width: 250,
                            child: Text(
                              "${cardState is CardLoaded && cardState.data != null ? cardState.name : 'Loading...'}",
                              style: AppTextStyle.cardText.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.darkColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 130,
                          right: 10,
                          child: Container(
                            color: AppColors.lightColor,
                            child: Text(
                              cardState is CardLoaded && cardState.data != null
                                  ? cardState.data!['data']['qrcode_text']
                                  : "Loading...",
                              style: AppTextStyle.cardText.copyWith(
                                fontSize: 14,
                                letterSpacing: 10,
                                color: AppColors.darkColor,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 42.5,
                          right: 15.5,
                          child: Container(
                            color: const Color.fromARGB(52, 255, 255, 255),
                            child: Text(
                              "Exp. 20 Sept 2025",
                              style: AppTextStyle.bodyText.copyWith(
                                fontSize: 8,
                                wordSpacing: 4.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  backWidget: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: AppColors.darkColor,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/member-card-back.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 2.5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              right: 20,
                            ),
                            child:
                                cardState is CardLoaded &&
                                        cardState.data != null
                                    ? Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.lightColor,
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: GestureDetector(
                                          onTap: () {
                                            AppAlert.popUp(context, [
                                              Stack(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      IconButton.filled(
                                                        onPressed: () {
                                                          AppHelpers.goBack(
                                                            context,
                                                          );
                                                        },
                                                        icon: Icon(Icons.close),
                                                      ),
                                                    ],
                                                  ),
                                                  Center(
                                                    child: const Text(
                                                      "QR Code",
                                                      style: AppTextStyle.title2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              QrImageView(
                                                foregroundColor: AppColors.darkColor,
                                                data:
                                                    cardState
                                                        .data!['data']['qrcode_text'],
                                                version: QrVersions.auto,
                                                gapless: false,
                                                eyeStyle: QrEyeStyle(
                                                  eyeShape: QrEyeShape.square,
                                                  color: AppColors.darkColor
                                                ),
                                                backgroundColor: AppColors.lightColor,
                                              ),
                                              const SizedBox(height: 20),
                                            ]);
                                          },
                                          child: QrImageView(
                                            foregroundColor: AppColors.darkColor,
                                            data:
                                                cardState
                                                    .data!['data']['qrcode_text'],
                                            version: QrVersions.auto,
                                            size: 102.5,
                                            gapless: false,
                                            backgroundColor: AppColors.lightColor,
                                            eyeStyle: QrEyeStyle(
                                              eyeShape: QrEyeShape.square,
                                              color: AppColors.darkColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    : Container(
                                      width: 102.5,
                                      height: 102.5,
                                      color: AppColors.lightColor,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "~ Geser kartu untuk melihat bagian belakang ~",
                style: AppTextStyle.label.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
