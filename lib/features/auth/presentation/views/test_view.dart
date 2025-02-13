import 'package:ai_weather/core/helper/cache_helper.dart';
import 'package:ai_weather/features/auth/data/model.dart/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    Future<UserModel?>? getUserData() async {
      final prefs = await SharedPreferences.getInstance();
      UserModel? data = await CacheHelper(prefs).getUserData();
      print(data?.name ?? 'no name');
      print(data?.id ?? 'no id');
      print(data?.email ?? 'no email');

      return data;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await getUserData();
              setState(() {});
            },
            child: Text('click'),
          ),
        ],
      ),
    );
  }
}
