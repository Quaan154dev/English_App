import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_pra/models/english_today.dart';
import 'package:flutter_app_pra/packages/qoute_model.dart';
import 'package:flutter_app_pra/packages/quote.dart';
import 'package:flutter_app_pra/pages/control_page.dart';
import 'package:flutter_app_pra/values/app_colors.dart';
import 'package:flutter_app_pra/values/app_fonts.dart';
import 'package:flutter_app_pra/values/app_icons.dart';
import 'package:flutter_app_pra/values/app_styles.dart';
import 'package:flutter_app_pra/values/widgets/app_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<EnglishToday> words = [];

  String quote = Quotes().getRandom().content!;

  List<int> fixedListRandom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  getEnglishToday() {
    List<String> newList = [];
    List<int> rens = fixedListRandom(len: 5, max: nouns.length);
    rens.forEach((e) {
      newList.add(nouns[e]);
    });

    words = newList.map((e) => getQuote(e)).toList();
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(
      noun: noun,
      quote: quote?.content,
      id: quote?.id,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    getEnglishToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Text(
            'English today',
            style: TextStyle(
                fontSize: 36, color: Colors.black, fontFamily: FontFamily.sen),
          ),
        ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Image.asset(AppIcons.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 10,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                '"${quote}"',
                style: AppStyle.h5
                    .copyWith(fontSize: 12, color: AppColors.textColor),
              ),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  //các thanh di chuyển theo
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: words.length,
                itemBuilder: (context, index) {
                  String firstLetter =
                      words[index].noun != null ? words[index].noun! : '';
                  firstLetter = firstLetter.substring(0, 1);

                  String leftLetter =
                      words[index].noun != null ? words[index].noun! : '';
                  leftLetter = leftLetter.substring(1, leftLetter.length);

                  String quoteDefault =
                      "Think of all the beauty still left around you and be .";

                  String qoute = words[index].quote != null
                      ? words[index].quote!
                      : quoteDefault;

                  return Padding(
                    padding: const EdgeInsets.all(0.4),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(3, 6),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(AppIcons.Heart),
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: firstLetter,
                              style: TextStyle(
                                fontSize: 89,
                                fontFamily: FontFamily.sen,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(3, 6),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              children: [
                                TextSpan(
                                  text: leftLetter,
                                  style: TextStyle(
                                    fontSize: 47,
                                    fontFamily: FontFamily.sen,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(3, 6),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              '"${qoute}"',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: FontFamily.sen,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //Indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: size.height * 1 / 11,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return buildIndicator(index == _currentIndex, size);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          setState(() {
            getEnglishToday();
          });
        },
        child: Image.asset(AppIcons.exchange),
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.lightBlue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Text(
                  'Your mind',
                  style: AppStyle.h3.copyWith(color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AppButton(
                  label: 'Favorites',
                  onTap: () {
                    print('test');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AppButton(
                  label: 'Your control',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ControlPage()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? size.width * 1 / 5 : 24,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightBlue : AppColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2, 3),
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
