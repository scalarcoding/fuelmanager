import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fuelmanager/ui/screens/home%20screen/home_screen.dart';
import 'package:fuelmanager/ui/screens/login_screen/signin_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/theme.dart';
import '../../../models/user_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, kSecondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/fuelmanager.png'),
              ),
              Text(
                "Fuel Manager App",
                style: txt17.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Manage your Fuel Data",
                style: txt12,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() {
    Timer(Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var status = prefs.getBool('isLoggedIn') ?? false;
      if (status) {
        AppUserData? appUserData;
        AppUserCredential? appUserCredential;
        appUserData = await AppUserData.fromSharedPreferences(prefs);
        appUserCredential =
            await AppUserCredential.fromSharedPreferences(prefs);
        Get.offAll(() => HomeScreen(
              appUserCredential: appUserCredential,
              appUserData: appUserData,
            ));
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
  }
}
