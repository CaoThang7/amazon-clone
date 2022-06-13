import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class UserServices {
  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.QUESTION,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Amazon thank, see you again',
        desc: 'Are you sure you want to exit the app?',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AuthScreen.routeName,
            (route) => false,
          );
        },
      )..show();
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
