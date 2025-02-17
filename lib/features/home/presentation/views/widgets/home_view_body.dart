import 'package:ai_weather/core/di/dependency_injection.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_days_list.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/details_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/temperture_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/welcome_message.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final userData = await sl<CacheHelper>().getUserData();
    setState(() {
      userName = userData!.name;
    });
  }

  MaterialColor getThemeColor(String? condition) {
    if (condition == null) {
      return Colors.blue;
    }
    switch (condition) {
      case 'Sunny':
        return Colors.orange;
      case 'Partly cloudy':
      case 'Cloudy':
      case 'Overcast':
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      case 'Mist':
      case 'Patchy rain possible':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Light rain shower':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Ice pellets':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
        return Colors.lightBlue;
      case 'Thundery outbreaks possible':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
        return Colors.deepPurple;
      case 'Blowing snow':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.blueGrey;
      case 'Blizzard':
        return Colors.blueGrey;
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
        return Colors.blueGrey;
      default:
        return Colors.blue; // Default color if the condition is not found
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor('Partly cloudy'),
            getThemeColor('Partly cloudy')[300]!,
            getThemeColor('Partly cloudy')[100]!,
          ], // الألوان التي تريدها
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSizeHelper.horizontalPadding,
          vertical: screenSizeHelper.homeVerticalPadding,
        ),
        child: Column(
          spacing: screenSizeHelper.screenHeight * 0.06,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeMessage(userName: userName),
            const ForcastDaysList(),
            const Center(
                child: const TempertureItem(
              temp: '20°C',
              type: 'Cloudy',
            )),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsItem(
                  type: 'Humidity',
                  value: '80%',
                ),
                DetailsItem(
                  type: 'Humidity',
                  value: '80%',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
