import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social/base/base_view_view_model.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';
import 'package:social/screen/profile/profile_binding.dart';

class ProfileScreen extends BaseView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    //FCF3F4
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/image/profile_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 37.w),
                    child: Image.asset(
                      "assets/image/back.png",
                      height: 20.w,
                      width: 20.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            width: 95.w,
                            height: 98.h,
                            child: Stack(
                              children: [
                                Transform.rotate(
                                  angle: -0.79,
                                  child: Container(
                                    width: 95.w,
                                    height: 98.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35.r),
                                      border: Border.all(
                                        color: AppColors.blackColor,
                                        width: 1.w,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    "assets/image/profile_user.png",
                                    height: 95.w,
                                    width: 95.w,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                "John Doe",
                                style: poppinsBold.copyWith(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "@johndoe",
                                style: poppinsRegular.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.grayColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 40.w, right: 40.w, top: 84.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Posts",
                                    style: poppinsRegular.copyWith(
                                      color: AppColors.text2Color,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "35",
                                    style: poppinsBold.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Followers",
                                    style: poppinsRegular.copyWith(
                                      color: AppColors.text2Color,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "1,552",
                                    style: poppinsBold.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Follows",
                                    style: poppinsRegular.copyWith(
                                      color: AppColors.text2Color,
                                      fontSize: 17.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "128",
                                    style: poppinsBold.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackColor,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/image/gallery_ic.png",
                              height: 24.w,
                              width: 24.w,
                            ),
                            Image.asset(
                              "assets/image/save_ic.png",
                              height: 24.w,
                              width: 24.w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 20,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.imageData.length,
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  controller.imageData[index],
                                );
                              }),
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
