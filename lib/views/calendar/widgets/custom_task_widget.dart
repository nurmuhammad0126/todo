import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/extensions/num_extension.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/assets.dart';
import '../../../core/widgets/w_container.dart';
import '../../../core/widgets/w_scale_animation.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => TaskWidgetState();
}

class TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return WContainer(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 10.w),

      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.w),
      color: AppColors.greyDark,
      child: Row(
        children: [
          CustomCircularCheckbox(value: false, onChanged: (bool value) {}),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Do Math Homework", style: AppTextStyles.s16w700),
                12.height,
                Row(
                  children: [
                    Text(
                      "Today At 16:45",
                      style: AppTextStyles.s14w400.copyWith(
                        color: AppColors.border,
                      ),
                    ),
                    Spacer(),
                    WContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 0,
                      ),
                      height: 29.toH(context),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.universityIcon,
                            width: 12.w,
                            height: 12.h,
                          ),
                          5.width,
                          Text("University", style: AppTextStyles.s10w400),
                        ],
                      ),
                    ),
                    15.width,
                    WContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 0,
                      ),
                      border: Border.all(color: AppColors.primary, width: 1.5),
                      color: AppColors.transparent,
                      height: 29.toH(context),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.flagIcon,
                            height: 14.w,
                            width: 14.w,
                          ),
                          5.width,
                          Text("1", style: AppTextStyles.s12w400),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCircularCheckbox extends StatefulWidget {
  final bool value;
  final void Function(bool value) onChanged;

  const CustomCircularCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCircularCheckbox> createState() => _CustomCircularCheckboxState();
}

class _CustomCircularCheckboxState extends State<CustomCircularCheckbox> {
  late bool value;
  @override
  void initState() {
    super.initState();
    value = widget.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WScaleAnimationWidget(
      scale: 0.7,
      onTap: () {
        setState(() {
          value = !value;
        });
        widget.onChanged.call(value);
      },
      child: WContainer(
        color: AppColors.transparent,
        border: Border.all(color: AppColors.surface, width: 2.w),
        padding: EdgeInsets.zero,
        width: 20.w,
        height: 20.w,
        borderRadius: BorderRadius.circular(100),
        child: value
            ? Icon(Icons.check, color: AppColors.surface, size: 18.w)
            : SizedBox.shrink(),
      ),
    );
  }
}
