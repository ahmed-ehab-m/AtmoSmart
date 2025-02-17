import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_day_item.dart';
import 'package:flutter/material.dart';

class ForcastDaysList extends StatelessWidget {
  const ForcastDaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeHelper(context).screenHeight * 0.14,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => const ForcastDayItem(),
        ),
      ),
    );
  }
}
