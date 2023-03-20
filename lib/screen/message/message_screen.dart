import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social/base/base_view_view_model.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';
import 'package:social/router/router_name.dart';
import 'package:social/screen/message/message_binding.dart';
import 'package:social/screen/widget/custome_textfield.dart';

class MessageScreen extends BaseView<MessageController> {
  const MessageScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      floatingActionButton: Container(
        height: 66.w,
        width: 66.w,
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
          child: Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: Image.asset(
              "assets/image/send.png",
              height: 24.w,
              width: 24.w,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/image/message_bg.png",
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/image/back.png",
                          height: 20.w,
                          width: 20.w,
                        ),
                      ),
                      Image.asset(
                        "assets/image/menu_ic.png",
                        height: 24.w,
                        width: 24.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 22.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Text(
                            "Messages",
                            style: poppinsBold.copyWith(
                              fontSize: 25.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          height: 48.h,
                          margin: EdgeInsets.symmetric(horizontal: 40.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.text1Color,
                                blurRadius: 25.r,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: AppColors.whiteColor,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                              ),
                              Image.asset(
                                "assets/image/search.png",
                                height: 18.w,
                                width: 18.w,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: CustomeTextfield(
                                    hinttextcolor: AppColors.hintColor,
                                    hint: 'Search for contacts',
                                    controller: controller.searchController,
                                    isPasswordField: false,
                                    customMaxLine: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.messageList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(RouterName.chat, arguments: [
                                  controller.messageList[index]["image"],
                                  controller.messageList[index]["name"],
                                ]);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 24.w,
                                  right: 24.w,
                                  bottom: 16.h,
                                ),
                                height: 100.h,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33.r),
                                  color: AppColors.transparentColor,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 68.w,
                                      width: 68.w,
                                      padding: EdgeInsets.all(3.r),
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 2.0),
                                          shape: BoxShape.circle),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(40.r),
                                        child: Image.asset(
                                          controller.messageList[index]["image"]
                                              .toString(),
                                          height: 62.w,
                                          width: 62.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.w,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 17.h),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.messageList[index]
                                                      ["name"]
                                                  .toString(),
                                              style: poppinsRegular.copyWith(
                                                fontSize: 13.sp,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9.h,
                                            ),
                                            Text(
                                              controller.messageList[index]
                                                      ["des"]
                                                  .toString(),
                                              style: poppinsRegular.copyWith(
                                                fontSize: 13.sp,
                                                overflow: TextOverflow.ellipsis,
                                                color: AppColors.text2Color,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
