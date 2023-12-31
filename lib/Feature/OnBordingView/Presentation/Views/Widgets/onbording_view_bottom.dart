import 'package:bagstore/Core/themaing/app_colors.dart';
import 'package:bagstore/Core/themaing/app_stayle.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBordBottom extends StatelessWidget {
  const CustomOnBordBottom({
    super.key,
    required this.currnetIndex,
    required this.pageController,
    required this.onPressed,
  });

  final int currnetIndex;
  final PageController pageController;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        return SizedBox(
          height: 55.h,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManger.primaryColor,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              currnetIndex ==
                      BlocProvider.of<OnbordingCubit>(context)
                              .onBoardingPages()
                              .length -
                          1
                  ? 'Get Started Now'
                  : 'Next',
              style: getRegularStyle(color: Colors.white, fontsize: 18.sp),
            ),
          ),
        );
      },
    );
  }
}
