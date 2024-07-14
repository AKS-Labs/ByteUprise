import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:byteuprise/consts/consts.dart';
import 'package:byteuprise/widgets_common/profile_menu.dart';
import 'package:byteuprise/widgets_common/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: Container(
          // color: lightGrey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            // color: lightGrey,
            child: Column(
              children: [
                const ProfilePic(),
                const SizedBox(height: 20),
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: "Notifications",
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Settings",
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Help Center",
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: "Log Out",
                  icon: "assets/icons/Log out.svg",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
