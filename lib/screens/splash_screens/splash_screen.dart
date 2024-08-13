// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(191923), // Background color #0A1128
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            children: [
              Container(
                color:
                    Colors.transparent, // Transparent to show background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to notes',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Lufga', // Applying Lufga font
                            color: Color(0xFFFEFCFB), // Text color #FEFCFB
                            fontSize: 24.sp, // Responsive font size
                          ),
                    ),
                    SizedBox(height: 170.h), // Space to move text higher
                  ],
                ),
              ),
              Container(
                color:
                    Colors.transparent, // Transparent to show background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Get organised with \n your workspace and \n generate new ideas ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Lufga', // Applying Lufga font
                            color: Color(0xFFFEFCFB), // Text color #FEFCFB
                            fontSize: 24.sp, // Responsive font size
                          ),
                    ),
                    SizedBox(height: 170.h), // Space to move text higher
                  ],
                ),
              ),
              Container(
                color:
                    Colors.transparent, // Transparent to show background color
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Build awesome projects and \n sync them together here',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Lufga', // Applying Lufga font
                            color: Color(0xFFFEFCFB), // Text color #FEFCFB
                            fontSize: 24.sp, // Responsive font size
                          ),
                    ),
                    SizedBox(height: 170.h), // Space between text and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Lufga', // Applying Lufga font
                              fontSize: 18.sp, // Responsive font size
                              color: Color.fromARGB(255, 1, 1,
                                  1), // Text color #FEFCFB for button
                            ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
                        backgroundColor:
                            Colors.white, // Button background transparent
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.r), // Rounded corners
                          side: BorderSide(
                              color: Color(
                                  0xFFFEFCFB)), // Border color matching text
                        ),
                      ),
                    ),
                    SizedBox(height: 80.h), // Space to move button higher
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30.h, // Bottom position for the indicator
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(
                dotHeight: 12.h, // Responsive dot height
                dotWidth: 12.w, // Responsive dot width
                activeDotColor: Color(0xFFFEFCFB), // Active dot color #FEFCFB
                dotColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
