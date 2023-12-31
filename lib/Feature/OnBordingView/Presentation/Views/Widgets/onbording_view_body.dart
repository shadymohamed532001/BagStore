import 'package:bagstore/Core/Uitls/clip_shapes.dart';
import 'package:bagstore/Core/Uitls/widgets/custom_clip_path.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/Widgets/custom_dot_items.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/Widgets/custom_skiper.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/Widgets/onbording_view_bottom.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/Widgets/onbording_view_logo.dart';
import 'package:bagstore/Feature/OnBordingView/Presentation/Views/manger/cubit/onbording_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({
    super.key,
    required this.cubit,
  });
  final OnbordingCubit cubit;

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (index) {
        widget.cubit.onChangePageIndex(index);
      },
      itemCount:
          BlocProvider.of<OnbordingCubit>(context).onBoardingPages().length,
      itemBuilder: (context, index) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            CustomClipPath(
              clipHight: height,
              clipper: Container3Clipper(),
            ),
            CustomSkiper(
              onTap: () {
                widget.cubit.navigateToLoginOrHome(context: context);
              },
            ),
            OnBordingLogo(
              image: widget.cubit.onBoardingPages()[index].imagepath!,
              width: width,
              height: height,
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * .5,
                    ),
                    Text(
                      widget.cubit.onBoardingPages()[index].tittle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff333333),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(widget.cubit.onBoardingPages()[index].subtittle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: const Color(0xff848484),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CustomDotItems(currnetIndex: index),
                          const Spacer(
                            flex: 5,
                          ),
                          CustomOnBordBottom(
                            currnetIndex: index,
                            pageController: pageController,
                            onPressed: () {
                              widget.cubit.navigateBetweenPages(
                                context: context,
                                pageController: pageController,
                              );
                            },
                          ),
                          const Spacer(
                            flex: 6,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
