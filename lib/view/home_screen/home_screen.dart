import 'dart:html';

import 'package:byteuprise/consts/colors.dart';
import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/consts/lists.dart';
import 'package:byteuprise/view/home_screen/components/internship_button.dart';
import 'package:byteuprise/widgets_common/homeBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:byteuprise/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:byteuprise/widgets_common/glassMorphism.dart';
import 'package:byteuprise/widgets_common/course_card.dart';
import 'package:byteuprise/widgets_common/secondary_course_card.dart';
import '../../model/course.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:byteuprise/view/home_screen/components/fitness_app_theme.dart';
import 'package:byteuprise/widgets_common/title_view.dart';
import 'package:byteuprise/widgets_common/glass_view.dart';
import 'package:byteuprise/fitness_app/fitness_app_home_screen.dart';
import 'dart:ui' as ui;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.animationController}) : super(key: key);
  //

  final AnimationController? animationController;
//

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {}

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xff8921aa), Color.fromARGB(255, 57, 46, 61)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Container(
      padding: const EdgeInsets.all(3),
      // color: lightGrey,
      color: FitnessAppTheme.background,
      width: context.screenWidth,
      height: context.screenWidth,
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Adjust the radius to your preference
                          borderSide: BorderSide
                              .none, // Use BorderSide.none for no border
                        ),
                        // Padding: EdgeInsets.all(8),
                        // border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: whiteColor,
                        hintText: searchanything,
                        hintStyle: TextStyle(color: prplColor),
                      ),
                    ).box.outerShadowSm.make(),
                  ),
                  10.heightBox,
                  // swiper courses

                  VxSwiper.builder(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    itemCount: sliderList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(sliderList[index], fit: BoxFit.fill)
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(EdgeInsets.symmetric(horizontal: 8))
                          .shadowXs
                          .make();
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      sliderList.length,
                      (index) => AnimatedContainer(
                        duration:
                            Duration(milliseconds: 300), // Animation duration
                        width: _currentIndex == index
                            ? 12
                            : 8, // Active circle is larger
                        height: _currentIndex == index
                            ? 12
                            : 8, // Active circle is larger
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color.fromARGB(179, 206, 5, 233)
                              : Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),

                  10.heightBox,
                  Text(
                    'ByteUprise,',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 150),
                            const Offset(150, 20),
                            <Color>[
                              Color.fromARGB(255, 234, 0, 255),
                              Color.fromARGB(255, 14, 133, 230),
                            ],
                          )),
                  ),

                  Text(
                    'Connecting you to the world, one tiny byte at a time! 🌍',
                    style: TextStyle(
                        fontSize: 22.0,
                        // fontWeight: FontWeight.bold,

                        foreground: Paint()..shader = linearGradient),
                  ),
                  7.heightBox,
                  // Text(
                  //   'Embark on a transformative journey with ByteUprise: 🌟 Dreams evolve into skills, aspirations flourish into expertise. Join us, where visionary paths converge into real-world mastery.',
                  //   style: TextStyle(
                  //       fontSize: 15.0,
                  //       // fontWeight: FontWeight.bold,
                  //       foreground: Paint()..shader = linearGradient),
                  // ),

                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? courses : internship,
                            )), // List. generate
                  ),
                  20.heightBox,

                  Container(
                      padding: const EdgeInsets.all(0),
                      color: lightGrey,
                      width: context.screenWidth,
                      // height: context.screenWidth,
                      child: SafeArea(
                          bottom: false,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    "Courses",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: coursess
                                        .map(
                                          (course) => Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: CourseCard(
                                              title: course.title,
                                              iconSrc: course.iconSrc,
                                              color: course.color,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ]))),

                  // home Buttons

                  // FitnessAppHomeScreen(),
                  SingleChildScrollView(
                   
                    child: Center(
                      child: SizedBox(
                        
                        height: 750, // Set the desired height
                        child:
                            FitnessAppHomeScreen(), // Your FitnessAppHomeScreen widget
                      ),
                    ),
                  ),

                  40.heightBox,

                  // swiper courses

                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 150,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      itemCount: secondsliderList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(secondsliderList[index],
                                fit: BoxFit.fill)
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),
                  40.heightBox,

                  //  3 home bottom btns

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButtons(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 3.5,
                              icon: index == 0
                                  ? icTopCategories
                                  : index == 1
                                      ? icBrands
                                      : icTopSeller,
                              title: index == 0
                                  ? topcourses
                                  : index == 1
                                      ? brand
                                      : reviews,
                            )),
                  ),

                  20.heightBox,

                  Align(
                      alignment: Alignment.centerLeft,
                      child: featuredcategories.text
                          .color(darkFontGrey)
                          .size(18)
                          .fontFamily(semibold)
                          .make()),
                  20.heightBox,

                  //  Internship buttons

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Column(
                          children: [
                            internshipButton(
                                icon: internship1[index],
                                title: internshipTitles1[index]),
                            10.heightBox,
                            internshipButton(
                                icon: internship2[index],
                                title: internshipTitles2[index]),
                          ],
                        ),
                      ).toList(),
                    ),
                  ),
                  20.heightBox,

                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: prplColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        recentProjects.text.white
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,

                        //

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                6,
                                (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        10.heightBox,
                                        "Laptop 4GB "
                                            .text
                                            .fontFamily(semibold)
                                            .color(darkFontGrey)
                                            .make()
                                      ],
                                    )
                                        .box
                                        .white
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 4))
                                        .roundedSM
                                        .padding(EdgeInsets.all(8))
                                        .shadowSm
                                        .make()),
                          ),
                        ),
                      ],
                    ),
                  ),

                  20.heightBox,
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 250),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            10.heightBox,
                            "Laptop 4GB "
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make()
                          ],
                        )
                            .box
                            .white
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .padding(EdgeInsets.all(18))
                            .shadowXs
                            .make();
                      })
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
