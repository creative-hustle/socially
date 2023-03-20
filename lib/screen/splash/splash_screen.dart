import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social/base/base_view_view_model.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';
import 'package:social/screen/splash/splash_binding.dart';

class SplashScreen extends BaseView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/splash.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                controller.home();
              },
              child: Image.asset(
                "assets/image/next_btn_black.png",
                height: 232.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 80.h,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Welcome to",
                  style: poppinsRegular.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.grayColor,
                  ),
                ),
                Text(
                  "Socially",
                  style: poppinsBold.copyWith(
                    fontSize: 39.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
                CarouselSlider.builder(
                  itemCount: controller.introImage.length,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(
                      controller.introImage[index].toString(),
                      height: 256.h,
                      fit: BoxFit.contain,
                    );
                  },
                  carouselController: controller.buttonCarouselController,
                  options: CarouselOptions(
                    height: 256.h,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      controller.sliderCurrent = index;
                      controller.update();
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: controller.sliderCurrent,
                  count: 3,
                  effect: const SlideEffect(
                    spacing: 8.0,
                    dotWidth: 12.0,
                    dotHeight: 12.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: AppColors.blackColor,
                    activeDotColor: AppColors.blackColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
