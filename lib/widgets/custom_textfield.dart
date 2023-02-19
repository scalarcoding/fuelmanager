import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../constant/theme.dart';

class CustomSearch extends StatelessWidget {
  TextEditingController? textEditingController;

  CustomSearch({this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: TextFormField(
            controller: textEditingController,
            cursorColor: TokpedGreen,
            decoration: InputDecoration(
              hoverColor: TokpedGreen,
              focusColor: TokpedGreen,
              hintText: "Search...",
              hintStyle: txt10,
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: TokpedGreen, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  void Function(String?)? onFieldSaved;
  void Function(String?)? onFieldChanged;
  TextEditingController? textEditingController;
  String? labelText;
  String? hint;
  int? maxLines;
  double? width;
  double? height;
  bool? enabled;
  String? Function(String?)? validator;
  AutovalidateMode? autovalidateMode;
  TextInputType? textInputType;
  Color? outlineColor;
  List<TextInputFormatter>? inputFormatter;

  CustomTextField({
    this.labelText,
    this.validator,
    this.enabled,
    this.hint,
    this.textEditingController,
    this.maxLines,
    this.width,
    this.autovalidateMode,
    this.height,
    this.textInputType,
    this.outlineColor,
    this.onFieldSaved,
    this.onFieldChanged,
    this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: width ?? Get.width,
        height: height == null
            ? validator == null
                ? 40
                : 80
            : 40,
        child: Center(
          child: TextFormField(
            inputFormatters: inputFormatter,
            keyboardType: textInputType ?? TextInputType.name,
            autovalidateMode: autovalidateMode == null
                ? AutovalidateMode.disabled
                : AutovalidateMode.onUserInteraction,
            validator: validator,
            enabled: enabled ?? true,
            style: txt16,
            maxLines: maxLines ?? 1,
            controller: textEditingController,
            cursorColor: TokpedGreen,
            decoration: InputDecoration(
              labelText: labelText ?? labelText,
              hoverColor: TokpedGreen,
              focusColor: TokpedGreen,
              hintText: hint ?? "",
              hintStyle: txt13,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: outlineColor == null ? Colors.black : outlineColor!,
                    width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorStyle: txt13.copyWith(color: Colors.redAccent),
              errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.redAccent, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onFieldSubmitted: onFieldSaved,
            onChanged: onFieldChanged,
          ),
        ),
      ),
    );
  }
}
