import 'package:flutter/material.dart';
import 'package:fuelmanager/constant/theme.dart';
import 'package:fuelmanager/models/user_model.dart';
import 'package:fuelmanager/widgets/custom_appbar.dart';
import 'package:fuelmanager/widgets/custom_button.dart';
import 'package:fuelmanager/widgets/custom_datepicker.dart';
import 'package:fuelmanager/widgets/custom_snackbar.dart';
import 'package:fuelmanager/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExternalRequestScreen extends StatefulWidget {
  AppUserData appUserData;

  ExternalRequestScreen({Key? key, required this.appUserData})
      : super(key: key);
  @override
  State<ExternalRequestScreen> createState() => _ExternalRequestScreenState();
}

class _ExternalRequestScreenState extends State<ExternalRequestScreen> {
  DateTime? chosenDate;
  final company_con = TextEditingController();
  final codenumber_con = TextEditingController();
  final loc_con = TextEditingController();
  final requestor_con = TextEditingController();
  bool isCreated = false;
  String? signature;
  SharedPreferences? prefs;
  AppUserData? userData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chosenDate = DateTime.now();
    asyncProcedures();
    company_con.text =
        TextEditingController().text = widget.appUserData.company!;

    requestor_con.text =
        TextEditingController().text = widget.appUserData.name!;
  }

  asyncProcedures() async {
    prefs = await SharedPreferences.getInstance();
    userData = await AppUserData.fromSharedPreferences(prefs!);
  }

  callbackFunction(dateReturn) async {
    setState(() {
      chosenDate = dateReturn;
    });
  }

  @override
  void dispose() {
    super.dispose();
    company_con.dispose();
    codenumber_con.dispose();
    loc_con.dispose();
    requestor_con.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Request Fuel External Pama"),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  CustomDatePicker(
                      chosenDate: chosenDate!,
                      callbackFunction: callbackFunction),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Form Permohonan Pengisian Fuel PT. Pama",
                      style: defaultBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    enabled: false,
                    textEditingController: company_con,
                    hint: "Perusahaan",
                  ),
                  CustomTextField(
                    enabled: false,
                    textEditingController: requestor_con,
                    hint: "Nama Pemohon",
                  ),
                  CustomTextField(
                    textEditingController: codenumber_con,
                    hint: "Code Number Unit",
                  ),
                  CustomTextField(
                    textEditingController: loc_con,
                    hint: "Detail Lokasi",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: CustomRRButton(
                        enabled: !isCreated,
                        outlineColor: kPrimaryColor,
                        borderRadius: 12,
                        color: kPrimaryColor,
                        contentColor: kSecondaryColor,
                        title: "Buat Permintaan",
                        width: Get.width * 0.4,
                        onTap: () async {
                          //on success
                          await Get.defaultDialog(
                            cancelTextColor: kPrimaryColor,
                            confirmTextColor: kPrimaryColor,
                            backgroundColor: kThirdColor,
                            buttonColor: kSecondaryColor,
                            title: "Process?",
                            middleText: "Yakin untuk proses request ini?",
                            onConfirm: () {
                              Get.back();
                              codenumber_con.clear();
                              loc_con.clear();
                              customSuccessMessage(
                                  "Sukses", "Sukses Mengirim Request Fuel");
                              setState(() {
                                isCreated = true;
                              });
                            },
                            onCancel: () {},
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: isCreated,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Report Anda Telah Dibuat, Klik Tombol Di Bawah Untuk Download / Share",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.download,
                                  color: kPrimaryColor,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: kPrimaryColor,
                                  size: 30,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class UserDataGet {
  static SharedPreferences? _prefs;
  static const _keyUsername = 'username';
  static const _keyCompany = 'company';

  static Future init() async => _prefs = await SharedPreferences.getInstance();
  static Future getUsername() async => _prefs!.getString(_keyUsername);
  static Future getCompany() async => _prefs!.getString(_keyUsername);
}
