import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/widgets/w_app_bar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WCustomAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      backgroundColor: AppColors.background,
      body: Center(child: Text("AddTaskScreen")),
    );
  }
}
