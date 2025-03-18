import 'package:finder_app/src/core/common/components/app_button.dart';
import 'package:finder_app/src/core/utils/constant/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFBF00),
        centerTitle: true,
        title: Text(
          "YPS Finder App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          child: SizedBox(
            width: scaledWidth(context),
            height: scaledHeight(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: 60.h),

                Center(
                  child: Text(
                    "Click the button to view your location",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: AppButton(
                    width: 250.w,
                    text: "Locate me",

                    enabled: true,
                    backgroundColor: Color(0xFFFFBF00),
                    height: 58.h,
                    fontSize: 16.sp,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
