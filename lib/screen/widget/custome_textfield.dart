import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social/res/app_colors.dart';
import 'package:social/res/style.dart';


class CustomeTextfield extends StatefulWidget {
  final String hint;
  final bool isPasswordField;
  bool showPassword = false;
  bool? isEnabled = false;
  bool? autoFocus;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputeAction ;
  final void Function(String)? onSubmit;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final double? customFontSize;
  final int? customMaxLine;
  final Color? textcolor;
  final Color? hinttextcolor;
  final TextAlign? customTextAlign;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  CustomeTextfield({
    Key? key,
    required this.hint,
    required this.controller,
    required this.isPasswordField,
    this.keyboardType,
    this.inputeAction,
    this.focusNode,
    this.suffixIcon,
    this.customFontSize,
    this.customMaxLine,
    this.textcolor,
    this.hinttextcolor,
    this.customTextAlign,
    this.onChanged,
    this.onSubmit,
    this.autoFocus,
    this.isEnabled,
    this.inputFormatters,
  }) : super(key: key) {
    showPassword = isPasswordField;
  }

  @override
  State<CustomeTextfield> createState() => _CustomeTextfieldState();
}

class _CustomeTextfieldState extends State<CustomeTextfield> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            enabled: widget.isEnabled,
            controller: widget.controller,
            onChanged: widget.onChanged,
            inputFormatters: widget.inputFormatters,
            focusNode: widget.focusNode,
            autofocus: widget.autoFocus ?? false,
            style: poppinsRegular.copyWith(
              fontSize: widget.customFontSize ?? 18.sp,
              color: widget.textcolor ?? AppColors.grayColor,
            ),
            textAlign: widget.customTextAlign ?? TextAlign.start,
            maxLines: widget.customMaxLine,
            cursorColor: AppColors.grayColor,
            textInputAction: widget.inputeAction,
            keyboardType: widget.keyboardType,
            obscureText: widget.showPassword,
            onSubmitted: widget.onSubmit,
            decoration: InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: poppinsRegular.copyWith(
                fontSize: widget.customFontSize ?? 16.sp,
                color: widget.hinttextcolor ??  AppColors.grayColor,
              ),
            ),
          ),
        ),
        widget.suffixIcon ??
            (widget.isPasswordField
                ? InkWell(
                    onTap: () {
                      setState(() {
                        widget.showPassword = !widget.showPassword;
                      });
                    },
                    child: Icon(
                      widget.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 15.w,
                      color: const Color(0xffA6A6A6),
                    ),
                  )
                : SizedBox(
                    height: 15.w,
                  )),
      ],
    );
  }
}
