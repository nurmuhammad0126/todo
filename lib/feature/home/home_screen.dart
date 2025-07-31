import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/constants/assets.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: WCustomAppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.menuIcon, width: 24.w, height: 24.w),
        ),
        title: Text("Index", style: AppTextStyles.s24w400),
        actions: [
          WContainer(
            padding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(100),
            width: 42.w,
            height: 42.w,

            child: Image.network(
              "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          75.height,
          Image.asset(
            Assets.homeImage,
            width: 227.w,
          ).paddingSymmetric(horizontal: 74.w),
          Text("What do you want to do today?", style: AppTextStyles.s24w400),
          10.height,
          Text("Tap + to add your tasks", style: AppTextStyles.s18w400),
          10.height,
        ],
      ),
    );
  }
}
