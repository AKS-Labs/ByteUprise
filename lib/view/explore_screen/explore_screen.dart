import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/widgets_common/course_card.dart';
import 'package:byteuprise/widgets_common/secondary_course_card.dart';
import '../../model/course.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenWidth,
        child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Courses",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: coursess
                          .map(
                            (course) => Padding(
                              padding: const EdgeInsets.only(left: 20),
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
                ]))));
  }
}
