import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/copmonants/loading_animation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  final Products productModel;

  const ProductItem({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r),
          border: Border.all(
              color: AppColors.primaryColor.withOpacity(.3), width: 2.w)),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r)),
                child: CachedNetworkImage(
                  imageUrl: productModel.thumbnail ?? AppStrings.noThingToShow,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 90,
                  placeholder: (context, url) => LoadingAnimation(),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title!,
                      maxLines: 1,
                      style: titleText(),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      productModel.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: descriptionText(),
                    ),
                    Row(
                      children: [
                        Text(
                          currentPrice(productModel.price!,
                              productModel.discountPercentage!),
                          style: priceText(),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '${productModel.price!} ${AppStrings.egb}',
                          style: discountText(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${AppStrings.reviews} (${productModel.rating?.toStringAsFixed(1)})',
                          style: reviewText(),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.star,
                          size: 22.h,
                          color: AppColors.starColor,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: Colors.white,
                child: Center(
                  child: Image.asset(AppImages.heartIcon),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
