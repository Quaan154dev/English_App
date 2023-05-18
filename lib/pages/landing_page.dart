import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_pra/pages/home_page.dart';
import 'package:flutter_app_pra/pages/control_page.dart';
import 'package:flutter_app_pra/values/app_colors.dart';
import 'package:flutter_app_pra/values/app_fonts.dart';
import 'package:flutter_app_pra/values/app_icons.dart';
import 'package:flutter_app_pra/values/app_styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome to',
                    style: AppStyle.h3,
                  )),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'English',
                      textAlign: TextAlign.left,
                      style: AppStyle.h2.copyWith(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text('Qoutes"',
                          textAlign: TextAlign.right,
                          style: AppStyle.h4.copyWith(height: 0.5)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: RawMaterialButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => HomePage()));
                    print('router');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  shape: CircleBorder(),
                  fillColor: AppColors.lightBlue,
                  child: Image.asset(AppIcons.right_arrow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
