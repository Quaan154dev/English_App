import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pra/values/app_colors.dart';
import 'package:flutter_app_pra/values/share_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/app_icons.dart';
import '../values/app_styles.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double sliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Text(
            'Your control ',
            style: TextStyle(
                fontSize: 36, color: Colors.black, fontFamily: FontFamily.sen),
          ),
        ),
        leading: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(Sharekeys.couter, sliderValue.toInt());
            Navigator.pop(context);
          },
          child: Image.asset(AppIcons.left_arrow),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              'How much a number word at once?',
              style:
                  AppStyle.h5.copyWith(color: AppColors.greyText, fontSize: 18),
            ),
            Spacer(),
            Text(
              '${sliderValue.toInt()}',
              style: AppStyle.h1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              value: sliderValue,
              min: 5,
              max: 100,
              divisions: 95,
              // activeColor: AppColors.primaryColor,
              inactiveColor: AppColors.primaryColor,
              onChanged: (value) {
                print(value);
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.centerLeft,
              child: Text(
                'slide to set',
                style: AppStyle.h5.copyWith(color: AppColors.textColor),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
