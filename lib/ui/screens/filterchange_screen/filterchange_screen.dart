import 'package:flutter/material.dart';
import 'package:fuelmanager/widgets/custom_appbar.dart';

class FilterChangeScreen extends StatelessWidget {
  const FilterChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "History Penggantian Filter"),
          Expanded(child: SingleChildScrollView())
        ],
      ),
    );
  }
}
