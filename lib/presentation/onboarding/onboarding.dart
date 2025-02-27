import 'package:campus_trade/campus_trade_app.dart';
import 'package:campus_trade/presentation/onboarding/onboarding_data.dart';
import 'package:campus_trade/presentation/resources/color_manager.dart';
import 'package:campus_trade/presentation/sign_in/sign_in.dart';
import 'package:campus_trade/utils/context_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:campus_trade/presentation/resources/text_styles.dart';
import '../resources/image_manager.dart';
import '../sign_up/sign_up.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int pageIndex = 0;
  List<OnboardingData> _onboardingData = [
    OnboardingData(
        title: 'Looking for College Equipment?',
        description:
            'Struggling to find the right tools for your studies? Get everything you need in one place!',
        imageUrl: ImageManager.questation),
    OnboardingData(
        title: 'Campus Trade is the Solution!',
        description:
            'Buy, sell, and donate college essentials with ease. A smarter way to equip yourself for success!',
        imageUrl: ImageManager.onboarding2),
    OnboardingData(
        title: 'Explore a Wide Range of Equipment',
        description:
            'From books to lab gear, find everything across all fields of study right at your fingertips!',
        imageUrl: ImageManager.onboarding3),
  ];

  void _nextPage() {
    setState(() {
      if (pageIndex < _onboardingData.length - 1) {
        pageIndex++;
      } else {
        context.navigateReplacementTo(SignUp());
      }
    });
  }

  void _skipOnboarding() {
    setState(() {
      pageIndex = _onboardingData.length - 1;
      context.navigateReplacementTo(SignUp());
    });
  }

  void function() {
    context.navigateReplacementTo(SignIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildPage(),
            _buildFooter(pageIndex, _onboardingData, _skipOnboarding, _nextPage,
                function),
          ],
        ),
      ),
    );
  }

  Widget _buildPage() {
    return Padding(
      padding: EdgeInsets.only(top: 73.h, left: 20.w, right: 20.w),
      child: Column(
        children: [
          Image.asset(_onboardingData[pageIndex].imageUrl),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                _onboardingData.length,
                ((index) => Padding(
                      padding: EdgeInsets.all(5.r),
                      child: AnimatedContainer(width: pageIndex == index? 40 : 10


                          ,height:11 ,decoration:

                          BoxDecoration(color:pageIndex== index?ColorManager.indicator:ColorManager.SecondaryColor ,borderRadius: BorderRadius.circular(43)),
                          duration: Duration(milliseconds: 500)),
                    ))),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            _onboardingData[pageIndex].title,
            style: TextStyles.black20Bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            _onboardingData[pageIndex].description,
            style: TextStyles.black16Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

Widget _buildFooter(
    pageIndex, _onboardingData, _skipOnboarding, _nextPage, function) {
  return Padding(
    padding: EdgeInsets.only(top: 140.h, left: 20.w, right: 20.w),
    child: Column(
      children: [
        Row(
          children: [
            Visibility(
              visible: pageIndex != _onboardingData.length - 1,
              child: Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: _skipOnboarding,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: ColorManager.SecondaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r)),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                  ),
                  child: Text("Skip", style: TextStyles.blue14Bold),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.SecondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r)),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: Text(
                    pageIndex == _onboardingData.length - 1
                        ? "Sign Up"
                        : "Next",
                    style: TextStyles.white14Bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        RichText(
          text: TextSpan(
            style: TextStyles.grey12Regular,
            children: [
              TextSpan(text: "Already have an account? "),
              TextSpan(
                text: "Sign In",
                style: TextStyles.blue12Medium,
                recognizer: TapGestureRecognizer()..onTap = function,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
