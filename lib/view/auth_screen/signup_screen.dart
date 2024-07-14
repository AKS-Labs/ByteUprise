import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/consts/lists.dart';
import 'package:byteuprise/consts/strings.dart';
import 'package:byteuprise/widgets_common/applogo_widget.dart';
import 'package:byteuprise/widgets_common/bg_widget.dart';
import 'package:byteuprise/widgets_common/custom_textfield.dart';
import 'package:byteuprise/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  applogoWidget(),
                  10.heightBox,
                  "Join $appname Community"
                      .text
                      .fontFamily(bold)
                      .white
                      .size(18)
                      .make(),
                  10.heightBox,
                  Column(
                    children: [
                      customTextField(hint: nameHint, title: name),
                      customTextField(hint: emailHint, title: email),
                      customTextField(hint: password, title: password),
                      customTextField(hint: password, title: retypePassword),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),

                      // ourButton().box.width(context.screenWidth - 50).make(),

                      5.heightBox,
                      Row(
                        children: [
                          Checkbox(
                              checkColor: whiteColor,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              }),
                          10.widthBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "I agree to the",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    )),
                                TextSpan(
                                    text: termsAndCond,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: prplColor,
                                    )),
                                TextSpan(
                                    text: "&",
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey,
                                    )),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                      fontFamily: regular,
                                      color: prplColor,
                                    )),
                              ],
                            )),
                          ),
                        ],
                      ),
                      15.heightBox,
                      ourButton(
                              color: isCheck == true ? prplColor : lightGrey,
                              title: signup,
                              textColor: whiteColor,
                              onPress: () {})
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                      10.heightBox,

                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style:
                                  TextStyle(fontFamily: bold, color: fontGrey),
                            ),
                            TextSpan(
                              text: login,
                              style:
                                  TextStyle(fontFamily: bold, color: prplColor),
                            )
                          ],
                        ),
                      ).onTap(() {
                        Get.back();
                      }),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(16))
                      .width(context.screenWidth - 70)
                      .shadowSm
                      .make()
                ],
              ),
            )));
  }
}
