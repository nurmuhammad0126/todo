import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';

class FocuseScreen extends StatefulWidget {
  const FocuseScreen({super.key});

  @override
  State<FocuseScreen> createState() => _FocuseScreenState();
}

class _FocuseScreenState extends State<FocuseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text("FocuseScreen"),),
    );
  }
}