import 'package:flutter/widgets.dart';

extension ExtSize on num {
  double get h => SizeUtilsExtension.instance.screenHeight * this / 812;
  double get w => SizeUtilsExtension.instance.screenWidth * this / 375;
  double get o => ((h + w) / 2);

  double toW(BuildContext context, {double figmaWidth = 375}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return this / figmaWidth * screenWidth;
  }

  /// Figma height: 375 ga nisbatan ekranga mos height hisoblab beradi
  double toH(BuildContext context, {double figmaHeight = 852}) {
    final screenHeight = MediaQuery.of(context).size.height;
    return this / figmaHeight * screenHeight;
  }
}

class SizeUtilsExtension {
  static final SizeUtilsExtension instance = SizeUtilsExtension._internal();
  late double screenWidth;
  late double screenHeight;

  SizeUtilsExtension._internal();

  void init(BuildContext context) {
    final mq = MediaQuery.of(context);
    screenWidth = mq.size.width;
    screenHeight = mq.size.height;
  }
}

extension Gap on num {
  SizedBox get height => SizedBox(height: h.toDouble());

  SizedBox get width => SizedBox(width: w.toDouble());
}

extension BuildContextX on BuildContext {
  double get screenWidth => SizeUtilsExtension.instance.screenWidth;
  double get screenHeight => SizeUtilsExtension.instance.screenHeight;
}
