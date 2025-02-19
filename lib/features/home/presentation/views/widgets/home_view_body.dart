import 'package:ai_weather/core/di/dependency_injection.dart';
import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/core/helper/functions/custom_snack_bar.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/location/get_location.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/features/home/domain/entities/current_weather_entity.dart';
import 'package:ai_weather/features/home/domain/entities/forecast_weather_entity.dart';
import 'package:ai_weather/features/home/presentation/controller/weather_cubit/weather_cubit.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_days_list.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/details_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/temperture_item.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String userName = "";
  CurrentWeatherEntity? weather;
  ForecastWeatherEntity? forecastWeather;
  Color color = Colors.blue;
  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    getData();
  }

  Future<void> fetchWeatherData() async {
    String position = await GetLocation.getCurrentLocation();
    BlocProvider.of<WeatherCubit>(context).getCurrentWeather(position);
    // BlocProvider.of<WeatherCubit>(context).getForeCastWeather(position);
  }

  Future<void> getData() async {
    final userData = await sl<CacheHelper>().getUserData();
    setState(() {
      userName = userData!.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSizeHelper = ScreenSizeHelper(context);

    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is GetWeatherLoading) {
          print('Loadgingggggggggggggggggggggg');
        }
        if (state is GetWeatherFailure) {
          showSnackBar(context, message: state.message, color: Colors.red);
          print('Failure');
        }
        if (state is GetWeatherSuccess) {
          weather = state.weatherEntity;
          weather!.color = BlocProvider.of<WeatherCubit>(context)
              .getThemeColor(weather?.condition ?? '');
          print('Success');
        }
      },
      builder: (context, state) {
        return RefreshIndicator(
          color: Colors.white,
          backgroundColor: kPrimaryColor,
          onRefresh: () async {
            await fetchWeatherData();
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  weather?.color ?? color,
                  weather?.color?.withAlpha(100) ?? color,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSizeHelper.horizontalPadding,
                vertical: screenSizeHelper.homeVerticalPadding,
              ),
              child: ListView(
                children: [
                  Column(
                    spacing: screenSizeHelper.screenHeight * 0.07,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WelcomeMessage(
                        location: weather?.location ?? '_',
                        userName: userName,
                        color: Colors.white.withAlpha(150),
                      ),
                      ForcastDaysList(
                        onTap: () {},
                        date: DateTime.now().day.toString(),
                        dayName: '',
                      ),
                      Center(
                          child: TempertureItem(
                        color: Colors.white.withAlpha(150),
                        temp: weather?.temp.truncate().toString() ?? '_',
                        type: weather?.condition.toString() ?? '_',
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailsItem(
                            // color: weather!.color!.withAlpha(50),
                            color: kPrimaryColor.withAlpha(250),

                            type: 'Humidity',
                            value: weather?.humidity ?? 0,
                          ),
                          DetailsItem(
                            // color: weather!.color!.withAlpha(50),
                            color: kPrimaryColor.withAlpha(250),
                            type: 'UV',
                            value: weather?.uv.truncate() ?? 0,
                          ),
                          DetailsItem(
                            // color: Colors.white.withAlpha(150),
                            color: kPrimaryColor.withAlpha(250) ?? color,

                            type: 'Rain',
                            value: weather?.rain.truncate() ?? 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
