import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/domain/core/global.dart';
import 'package:news_app/domain/db/language.dart';
import 'package:news_app/presentation/widgets/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  PageController _controller = PageController();
  ValueNotifier<bool> _isLastPage = ValueNotifier(false);
  ValueNotifier<int> _buttonValue = ValueNotifier(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80.sm),
        child: PageView(
          onPageChanged: ((value) {
            if (value == 2) {
              _isLastPage.value = true;
            } else {
              _isLastPage.value = false;
            }

            _isLastPage.notifyListeners();
          }),
          controller: _controller,
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
            ),
            Container(
              color: Colors.white,
              child: ValueListenableBuilder(
                  valueListenable: _buttonValue,
                  builder: (context, int val, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select Country",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 25.sm),
                        ),
                        Gap(H: 50.sm),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "UAE",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 0,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "USA",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 1,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "INDIA",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 2,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "UKRAINE",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 3,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "RUSSIA",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 4,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.sm),
                          title: Text(
                            "CANADA",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18.sm,
                                    fontWeight: FontWeight.w500),
                          ),
                          trailing: Radio<int>(
                            groupValue: _buttonValue.value,
                            value: 5,
                            onChanged: ((value) {
                              _buttonValue.value = value!;
                              _buttonValue.notifyListeners();
                            }),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomSheet: ValueListenableBuilder(
          valueListenable: _isLastPage,
          builder: (context, bool val, _) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sm),
              height: 80.sm,
              decoration: BoxDecoration(color: Colors.white),
              child: _isLastPage.value
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.sm, horizontal: 10.sm),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_buttonValue.value != 10) {
                            await DbFunctions.saveCurrentLanguage(
                                _buttonValue.value);
                            Global.lang = langs[_buttonValue.value];
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            Fluttertoast.showToast(
                                msg: "select a country first");
                          }
                        },
                        child: Text(
                          "Lets Start",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18.sm),
                        ),
                        color: Theme.of(context).cardColor.withOpacity(0.2),
                        colorBrightness: Brightness.light,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          TextButton(
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              child: Text(
                                "SKIP",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16.sm),
                              )),
                          Center(
                            child: SmoothPageIndicator(
                              controller: _controller,
                              count: 3,
                              effect: WormEffect(
                                  dotWidth: 8.sm,
                                  dotHeight: 10.sm,
                                  dotColor: Color.fromARGB(255, 184, 184, 184),
                                  activeDotColor: Theme.of(context).cardColor),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                "NEXT",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16.sm),
                              )),
                        ]),
            );
          }),
    );
  }
}
