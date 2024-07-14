import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/home_controller/home_controller.dart';
import 'package:byteuprise/view/courses_screen/courses_screen.dart';
import 'package:byteuprise/view/explore_screen/explore_screen.dart';
import 'package:byteuprise/view/home_screen/home_screen.dart';
import 'package:byteuprise/view/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = Home(animationController: animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 20), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 20), label: courses),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 20), label: explore),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 20), label: profile),
    ];

    var navBody = [
      const HomeScreen(),
      const CoursesScreen(),
      const ExploreScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedItemColor: prplColor,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              items: navbarItem,
              onTap: (value) {
                controller.currentNavIndex.value = value;
              }),
        ));
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
