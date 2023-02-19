import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuelmanager/constant/theme.dart';
import 'package:fuelmanager/ui/screens/login_screen/signin_screen.dart';
import 'package:fuelmanager/ui/screens/sonding_screen/sonding_history.dart';
import 'package:fuelmanager/ui/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import 'ui/screens/home screen/home_screen.dart';
import 'ui/screens/sonding_screen/sonding_record.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FuelManager());
}

class FuelManager extends StatelessWidget {
  FuelManager({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getAppTheme(context),
      home: SplashScreen(),
    );
  }
}
