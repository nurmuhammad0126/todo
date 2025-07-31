import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';

import '../widgets/custom_horizontal_calendar.dart';
import '../widgets/custom_task_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: WCustomAppBar(
        title: Text('Calendar', style: AppTextStyles.s20w400),
      ),
      body: ListView(
        children: [
          CustomHorizontalCalendar(),

          WContainer(
            padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),

            margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.w),
            color: AppColors.greyLight,
            child: Row(
              children: [
                Expanded(
                  child: WScaleAnimationWidget(
                    onTap: () {},
                    child: WContainer(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Text("Today", style: AppTextStyles.s16w700),
                    ),
                  ),
                ),
                32.width,
                Expanded(
                  child: WScaleAnimationWidget(
                    onTap: () {},
                    child: WContainer(
                      border: Border.all(color: AppColors.border, width: 2.w),
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      child: Text("Completed", style: AppTextStyles.s16w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(10, (index) => TaskWidget()),
        ],
      ),
    );
  }
}
