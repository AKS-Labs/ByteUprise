import 'dart:io';

import 'package:byteuprise/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/fitness_app/fitness_app_home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(CoursesScreen()));
}



class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    {
      return MaterialApp(
        title: 'Flutter UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: AppTheme.textTheme,
          platform: TargetPlatform.iOS,
        ),
        home: FitnessAppHomeScreen(),
      );

      // padding: const EdgeInsets.all(12),
      // color: lightGrey,
      // width: context.screenWidth,
      // height: context.screenWidth
      //  child: SafeArea(
      //   ret
      //  );
      //     child: Column(children: [
      //   Container(
      //     alignment: Alignment.center,
      //     height: 60,
      //     color: lightGrey,
      //   ),
      //   Align(
      //       alignment: Alignment.centerLeft,
      //       child: courses.text
      //           .color(prplColor)
      //           .size(18)
      //           .fontFamily(semibold)
      //           .make()),
      //   20.heightBox,
      //   GridView.builder(
      //       physics: NeverScrollableScrollPhysics(),
      //       shrinkWrap: true,
      //       itemCount: 6,
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           mainAxisSpacing: 8,
      //           crossAxisSpacing: 8,
      //           mainAxisExtent: 250),
      //       itemBuilder: (context, index) {
      //         return Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Image.asset(
      //               imgP1,
      //               height: 150,
      //               width: 150,
      //               fit: BoxFit.cover,
      //             ),
      //             10.heightBox,
      //             "Laptop 4GB "
      //                 .text
      //                 .fontFamily(semibold)
      //                 .color(darkFontGrey)
      //                 .make()
      //           ],
      //         )
      //             .box
      //             .white
      //             .margin(const EdgeInsets.symmetric(horizontal: 4))
      //             .roundedSM
      //             .padding(EdgeInsets.all(18))
      //             .shadowXs
      //             .make();
      //       })
      // ])
      // ));
    }
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
