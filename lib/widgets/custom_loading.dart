import 'package:flutter/material.dart';
import 'package:fuelmanager/constant/theme.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

class LoaderDialog {
  static void showLoadingDialog(BuildContext context, String message) async {
    var wid = Get.width / 2;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Dialog(
              backgroundColor: Colors.white,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 90.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoadingBouncingGrid.square(
                        size: 30,
                        backgroundColor: kPrimaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(message),
                        ),
                      ),
                    ],
                  ))),
        );
      },
    );
  }
}
