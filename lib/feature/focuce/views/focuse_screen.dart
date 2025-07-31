import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo/core/constants/app_colors.dart';
import 'package:todo/core/constants/app_text_style.dart';
import 'package:todo/core/extensions/num_extension.dart';
import 'package:todo/core/extensions/widget_extension.dart';
import 'package:todo/core/widgets/w_app_bar.dart';
import 'package:todo/core/widgets/w_container.dart';
import 'package:todo/core/widgets/w_scale_animation.dart';

import '../widgets/rouded_circular_progress_indecator_widget.dart';

class FocuseScreen extends StatefulWidget {
  const FocuseScreen({super.key});

  @override
  State<FocuseScreen> createState() => _FocuseScreenState();
}

class _FocuseScreenState extends State<FocuseScreen> {
  final Duration totalDuration = const Duration(minutes: 35);
  late Duration currentDuration;
  late Timer _timer;
  late ValueNotifier<double> progressNotifier;
  late ValueNotifier<String> timeTextNotifier;

  @override
  void initState() {
    super.initState();
    currentDuration = totalDuration;

    progressNotifier = ValueNotifier(1.0);
    timeTextNotifier = ValueNotifier(formatDuration(currentDuration));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration.inSeconds == 0) {
        timer.cancel();
        return;
      }

      currentDuration -= const Duration(seconds: 1);
      progressNotifier.value =
          currentDuration.inSeconds / totalDuration.inSeconds;
      timeTextNotifier.value = formatDuration(currentDuration);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    progressNotifier.dispose();
    timeTextNotifier.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final double size = 260.toW(context);

    return Scaffold(
      appBar: WCustomAppBar(
        leading: Text('Focus Mode', style: AppTextStyles.s20w400),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            60.height,
            SizedBox(
              width: size + 10,
              height: size + 10,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: size,
                    height: size,
                    child: RoundedCircularProgressIndicator(
                      progress: 1,
                      strokeWidth: 16,
                      progressColor: AppColors.greyDark,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: size,
                    height: size,
                    child: ValueListenableBuilder<double>(
                      valueListenable: progressNotifier,
                      builder: (_, value, __) {
                        return RoundedCircularProgressIndicator(
                          progress: value,
                          strokeWidth: 16,
                          progressColor: AppColors.primary,
                          backgroundColor: Colors.transparent,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: size / 2 - 10,
                    child: ValueListenableBuilder<String>(
                      valueListenable: timeTextNotifier,
                      builder: (_, value, __) {
                        return Text(value, style: AppTextStyles.s22w800);
                      },
                    ),
                  ),
                ],
              ),
            ),
            20.height,
            Text(
              "While your focus mode is on, all of your notifications will be off",
              style: AppTextStyles.s18w700,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 20.w),
            20.height,
            WScaleAnimationWidget(
              onTap: () {},
              child: WContainer(
                width: 180.toW(context),
                height: 48.toH(context),
                child: Text("Start Focusing", style: AppTextStyles.s16w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
