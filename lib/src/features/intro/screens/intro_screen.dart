import 'package:finder_app/src/core/common/components/app_button.dart';
import 'package:finder_app/src/core/utils/constant/route_constant.dart';
import 'package:finder_app/src/core/utils/constant/util.dart';
import 'package:finder_app/src/core/utils/helpers/alert.dart';
import 'package:finder_app/src/features/intro/bloc/intro_bloc/intro_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late IntroCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<IntroCubit>(context);
    super.initState();
  }

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
                BlocConsumer<IntroCubit, IntroState>(
                  listener: (context, state) {
                    if (state is IntroError) {
                      showAlertMessage(
                        context,
                        message: state.error ?? "",
                        backgroundColor: Colors.red,
                      );
                    }

                    if (state is IntroSuccess) {
                      showAlertMessage(
                        context,
                        message: state.message ?? "",
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushNamed(context, RouteLiterals.homeScreen);
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: AppButton(
                        width: 250.w,
                        text: "Locate me",
                        isLoading: state is IntroLoading,
                        enabled: state is! IntroLoading,
                        backgroundColor: Color(0xFFFFBF00),
                        height: 58.h,
                        fontSize: 16.sp,
                        onPressed: () {
                          _cubit.fetchUserIp();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
