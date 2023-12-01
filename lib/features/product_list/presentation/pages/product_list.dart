import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/copmonants/custom_formfield.dart';
import '../../../../core/copmonants/loading_animation.dart';
import '../../../../core/di/config.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/styles.dart';
import '../../domain/use_cases/product_list_use_case.dart';
import '../cubit/products_list_cubit.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ProductsListCubit(getIt<ProductListUseCase>())..getProducts(),
      child: BlocConsumer<ProductsListCubit, ProductsListState>(
        listener: (BuildContext context, state) {
          if (state is ProductsFailureState) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: AlertDialog(
                  title: const Icon(Icons.error),
                  content: Text(
                    AppStrings.errorText,
                    style: errorText(),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: state is ProductsFailureState
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.signal_wifi_connected_no_internet_4_outlined,
                          size: 50,
                        ),
                        Text(
                          AppStrings.noInternet,
                          style: errorText(),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: state is ProductsSuccessState
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Image.asset(AppImages.routeLogo),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomFormField(
                                          text: AppStrings.searchText,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 23.w,
                                      ),
                                      ImageIcon(
                                        size: 30,
                                        const AssetImage(
                                          AppImages.shoppingCartIcon,
                                        ),
                                        color: AppColors.primaryColor,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        state.productsList.products!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 191.w / 241.h,
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 16.w,
                                            mainAxisSpacing: 16.h),
                                    itemBuilder: (context, index) {
                                      return ProductItem(
                                          productModel: state
                                              .productsList.products![index]);
                                    },
                                  )
                                ],
                              ),
                            )
                          : state is ProductsLoadingState
                              ? Center(
                                  child: SizedBox(
                                      height: 1000.h,
                                      child: LoadingAnimation()),
                                )
                              : Container(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
