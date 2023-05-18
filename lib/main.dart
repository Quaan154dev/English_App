import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_pra/app_ui.dart';
import 'package:flutter_app_pra/packages/qoute_model.dart';
import 'package:flutter_app_pra/packages/quote.dart';
import 'package:flutter_app_pra/pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quotes().getAll();
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.leanBack,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LandingPage(),
        // child: Text('hello'),
        // child: Image.asset(AppUI.imgIphone81),
        // child: Text(
        //   'Welcome to the my app',
        //   style: AppStyle.title.copyWith(color: Colors.blue),
        // ),
      ),
    );
  }
}
