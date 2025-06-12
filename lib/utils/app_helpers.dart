import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelpers {
  static Future<DateTime?> datePicker(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    return picked;
  }

  static Future<void> lodaData(isOk, isNotOk, isMount, isData) async {
    try {
      final data = await isData;
      if (isMount) {
        isOk(data);
      }
    } catch (e) {
      if (isMount) {
        isNotOk();
      }
      print("Error: $e");
    }
  }

  static void goTo(
    BuildContext context,
    Widget route, [
    bool animated = false,
    bool backRoute = true,
  ]) {
    Navigator.pushAndRemoveUntil(
      context,

      animated
          ? animateRouting(context, route)
          : MaterialPageRoute(builder: (context) => route),
      (route) => backRoute,
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Route animateRouting(BuildContext context, Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, route) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: route);
      },
    );
  }

  static const String bismillah =
      'بِسْــــــــــــــــــمِ اللهِ الرَّحْمَنِ الرَّحِيْمِ ◌';

  static String toCapitalize(String text) {
    final List<String> firstStage = text.split('');
    final List<String> secondStage = [];

    for (var i = 0; i < firstStage.length; i++) {
      if (i == 0) {
        secondStage.add(firstStage[i].toUpperCase());
      } else {
        secondStage.add(firstStage[i].toLowerCase());
      }
    }

    return secondStage.join();
  }

  static void inputValidation(bool condition, void Function() isTrue) {
    condition ? isTrue() : null;
  }

  static void launchUrlPath([String? pathUrl]) async {
    try {  
      final Uri url = Uri.parse(pathUrl ?? dotenv.env['APP_REGISTRATION_URL']!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
