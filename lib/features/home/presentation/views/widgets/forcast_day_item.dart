import 'package:flutter/material.dart';

class ForcastDayItem extends StatelessWidget {
  const ForcastDayItem({
    super.key,
    required this.color,
    required this.dayName,
    required this.date,
  });
  final Color color;
  final String dayName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          // color: isSelected
          //     ? Colors.white.withAlpha(100)
          //     : kPrimaryColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              dayName,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: color),
            ),
            const Spacer(),
            Text(
              date,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: color),
            )
          ],
        ),
      ),
    );
  }
}
