import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social/base/base_view_view_model.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';
import 'package:social/screen/chat/chat_binding.dart';
import 'package:social/screen/widget/custome_textfield.dart';

class ChatScreen extends BaseView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget vBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8.r),
              height: 206.h,
              width: double.infinity,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: const DecorationImage(
                  image: AssetImage("assets/image/chat_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 37.w),
                      child: Image.asset(
                        "assets/image/back.png",
                        height: 20.w,
                        width: 20.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 33.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 78.w,
                        height: 78.h,
                        margin: EdgeInsets.only(left: 46.w),
                        child: Stack(
                          children: [
                            Transform.rotate(
                              angle: -0.79,
                              child: Container(
                                width: 78.w,
                                height: 78.h,
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  controller.userImage ?? "assets/image/message1.jpg",
                                  height: 71.w,
                                  width: 71.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 36.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userName ?? "",
                            style: poppinsRegular.copyWith(
                              fontSize: 20.sp,
                              color: AppColors.blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Online",
                            style: poppinsRegular.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.text2Color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Stack(
                    children: [
                      ListView.builder(
                        itemCount: controller.textMsgList.length,
                        shrinkWrap: true,
                        reverse: true,
                        padding: EdgeInsets.only(
                          left: 18.w,
                          right: 18.w,
                          bottom: 110.h,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              controller.textMsgList[index]["author"] == "0"
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 10.h,
                                                ),
                                                margin: EdgeInsets.only(right: 60.w),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(15.r),
                                                    bottomLeft: Radius.circular(15.r),
                                                    bottomRight: Radius.circular(15.r),
                                                  ),
                                                  color: AppColors.text4Color,
                                                ),
                                                child: Text(
                                                  controller.textMsgList[index]["msg"],
                                                  style: poppinsRegular.copyWith(
                                                    fontSize: 13.sp,
                                                    color: AppColors.text2Color,
                                                    overflow: TextOverflow.visible,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 10.h,
                                                ),
                                                margin: EdgeInsets.only(left: 60.w),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(15.r),
                                                    bottomLeft: Radius.circular(15.r),
                                                    bottomRight: Radius.circular(15.r),
                                                  ),
                                                  color: AppColors.text4Color,
                                                ),
                                                child: Text(
                                                  controller.textMsgList[index]["msg"],
                                                  style: poppinsRegular.copyWith(
                                                    fontSize: 13.sp,
                                                    color: AppColors.text2Color,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 40.w,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(39.r),
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: CustomeTextfield(
                                hint: 'Write a message....',
                                controller: controller.sendMsgController,
                                isPasswordField: false,
                                customFontSize: 14.sp,
                                customMaxLine: 1,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.sendMsgController.clear();
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              height: 66.w,
                              width: 66.w,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/image/bottomsheet.png"),
                                ),
                                borderRadius: BorderRadius.circular(23.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.text3Color,
                                    blurRadius: 12.r,
                                    spreadRadius: -2,
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
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
