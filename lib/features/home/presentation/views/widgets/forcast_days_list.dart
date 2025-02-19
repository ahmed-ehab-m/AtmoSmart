import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_day_item.dart';
import 'package:flutter/material.dart';

class ForcastDaysList extends StatefulWidget {
  const ForcastDaysList(
      {super.key,
      required this.dayName,
      required this.onTap,
      required this.date});
  final String dayName;
  final String date;
  final void Function()? onTap;
  @override
  State<ForcastDaysList> createState() => _ForcastDaysListState();
}

class _ForcastDaysListState extends State<ForcastDaysList> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeHelper(context).screenHeight * 0.13,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              widget.onTap;
              isSelected = index;
              setState(() {});
            },
            child: ForcastDayItem(
                date: widget.date,
                dayName: widget.dayName,
                color: isSelected == index
                    ? Colors.white.withAlpha(100)
                    : kPrimaryColor.withAlpha(100)),
          ),
        ),
      ),
    );
  }
}
