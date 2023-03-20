import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social/base/base_view_view_model.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';
import 'package:social/router/router_name.dart';
import 'package:social/screen/home/home_binding.dart';

class HomeScreen extends BaseView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 62.w,
        width: 62.w,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/image/bottomsheet.png"),
          ),
          borderRadius: BorderRadius.circular(23.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.text3Color,
              blurRadius: 12.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            "assets/image/bottom_plus.png",
            height: 26.w,
            width: 26.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70.h,
        padding: EdgeInsets.only(left: 30.w, right: 30.w,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
            bottomLeft: const Radius.circular(0),
            bottomRight: const Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBlackColor,
              blurRadius: 15.r,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/home_ic.png",
                  height: 20.h,
                  width: 18.w,
                  color: AppColors.greenColor,
                ),
                SizedBox(
                  width: 44.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterName.message);
                  },
                  child: Image.asset(
                    "assets/image/chat_ic.png",
                    height: 20.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/like_ic.png",
                  height: 20.h,
                  width: 18.w,
                ),
                SizedBox(
                  width: 44.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterName.profile);
                  },
                  child: Image.asset(
                    "assets/image/profile_ic.png",
                    height: 20.h,
                    width: 18.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/image/home.png",
            height: 610.h,
            fit: BoxFit.contain,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Socially",
                        style: poppinsBold.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        size: 24.r,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Feed",
                    style: poppinsBold.copyWith(
                      fontSize: 25.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 62.h,
                          width: double.infinity,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding:    EdgeInsets.symmetric(horizontal: 24.w),
                            itemCount: controller.storyList.length + 1,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 16.w,
                              );
                            },
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.gradientColor,
                                          blurRadius: 12.r,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      "assets/image/story.png",
                                      height: 56.w,
                                      width: 56.w,
                                      // fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              } else {
                                var newIndex = index - 1;
                                return Container(
                                  // margin: EdgeInsets.only(right: 20.w),
                                  child: Image.asset(
                                    "${controller.storyList[newIndex]}",
                                    width: 56.w,
                                    height: 56.w,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 39.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.homeData.length,
                          padding: EdgeInsets.only(left: 24.w,right: 24.w,bottom: 24.h),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 32.h,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              height: 288.h,
                              width: double.infinity,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20.r),
                              //   boxShadow: [
                              //     BoxShadow(
                              //       color: AppColors.hintColor,
                              //       blurRadius: 10.r,
                              //       offset: const Offset(0, 2),
                              //     ),
                              //   ],
                              // ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: Image.asset(
                                      height: 288.h,
                                      width: double.infinity,
                                      controller.homeData[index]["image"]
                                          .toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(13.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      100.r),
                                              child: Image.asset(
                                                controller.homeData[index]
                                                        ["profile"]
                                                    .toString(),
                                                height: 36.w,
                                                width: 36.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 7.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.homeData[index]
                                                          ["name"]
                                                      .toString(),
                                                  style:
                                                      poppinsRegular.copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors.whiteColor,
                                                  ),
                                                ),
                                                Text(
                                                  controller.homeData[index]
                                                          ["time"]
                                                      .toString(),
                                                  style:
                                                      poppinsRegular.copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors.textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/image/option_menu.png",
                                          height: 18.h,
                                          width: 5.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(13.r),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 9.w,
                                              vertical: 6.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              color:
                                                  AppColors.decorationColor,
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/image/like.png",
                                                  height: 18.w,
                                                  width: 18.w,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  controller.homeData[index]
                                                          ["like"]
                                                      .toString(),
                                                  style:
                                                      poppinsRegular.copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 9.w,
                                              vertical: 6.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              color:
                                                  AppColors.decorationColor,
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/image/chat.png",
                                                  height: 18.w,
                                                  width: 18.w,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  controller.homeData[index]
                                                          ["chat"]
                                                      .toString(),
                                                  style:
                                                      poppinsRegular.copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 9.w,
                                              vertical: 6.h,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              color:
                                                  AppColors.decorationColor,
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/image/save.png",
                                                  height: 18.w,
                                                  width: 18.w,
                                                ),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                Text(
                                                  controller.homeData[index]
                                                          ["save"]
                                                      .toString(),
                                                  style:
                                                      poppinsRegular.copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        AppColors.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
