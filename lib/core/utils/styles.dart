import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle titleText() => GoogleFonts.poppins(
    fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.textColor);

TextStyle descriptionText() => GoogleFonts.poppins(
    fontSize: 15.sp, fontWeight: FontWeight.w600, color: AppColors.textColor);

TextStyle priceText() => GoogleFonts.poppins(
    fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.textColor);

TextStyle reviewText() => GoogleFonts.poppins(
    fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.textColor);

TextStyle errorText() => GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor.withOpacity(.8));

TextStyle discountText() => GoogleFonts.poppins(
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.primaryColor.withOpacity(.7),
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor.withOpacity(.5));
