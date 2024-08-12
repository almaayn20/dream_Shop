import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/Features/order/data/models/order_model/order_product.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/product_details_state.dart';
import 'package:foody/Features/product/presentation/widgets/product_details_app_bar.dart';
import 'package:foody/Features/product/presentation/widgets/product_quantity.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends GetView<ProductDetailsController> {
  ProductDetailScreen({required this.productEntity, Key? key})
      : super(key: key);
  final ProductEntity productEntity;
  final AddNewOrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white100,
      bottomNavigationBar: addToCartButton(context),
      body: CustomScrollView(
        slivers: <Widget>[
          productDetailsAppBar(
            productEntity: productEntity,
            context: context,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildContent(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget addToCartButton(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          orderController.addOrderProduct(OrderProductEntity(
              productUid: productEntity.productId.toInt(),
              productQuantity: controller.quantity,
              productPrice: productEntity.productPrice.toDouble()));
          snackBarCustom(context, 'product added to cart', '', () {});
        },
        child: Container(
            alignment: Alignment.center,
            height: 58.h,
            padding: EdgeInsets.only(top: AppSpacing.space8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.space8,
                    AppSpacing.space8,
                    AppSpacing.space16,
                    AppSpacing.space8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange100,
                    boxShadow: AppShadow.buttonWhite,
                    borderRadius: circularRadius(AppRadius.border32),
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.white100,
                          borderRadius: circularRadius(AppRadius.border20),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/lock.svg",
                          width: 18.w,
                          height: 18.w,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        ("add to cart").toUpperCase(),
                        style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReview(),
          SizedBox(height: 16.h),
          productQuantity(productEntity: productEntity, controller: controller),
          SizedBox(height: 22.h),
          Text(
            productEntity.productDescription,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w300,
              color: AppColors.gray100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 4.w),
        SvgPicture.asset(
          "assets/icons/star.svg",
          width: 18.w,
          height: 18.w,
        ),
        SizedBox(width: 8.w),
        Text(
          '4.5',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.dark80,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          "(${4.5 > 25 ? "25+" : 4.5})",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
            color: AppColors.gray100,
          ),
        ),
      ],
    );
  }
}
