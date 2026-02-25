import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class DotIndicator extends StatelessWidget {
  final int dotCount;
  final int activeIndex;

  const DotIndicator({
    super.key,
    required this.dotCount,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == activeIndex ? 10 : 8,
          height: index == activeIndex ? 10 : 8,
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.activeDot
                : AppColors.inactiveDot,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
