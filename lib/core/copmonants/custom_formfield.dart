import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class CustomFormField extends StatelessWidget {
  final String text;

  CustomFormField({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            hintText: text,
            prefixIcon: ImageIcon(
              const AssetImage(AppImages.searchIcon),
              color: AppColors.primaryColor,
            ),
            contentPadding: EdgeInsets.only(top: 5)),
      ),
    );
  }
}
