import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/views/checkout.dart';
import 'package:foody/Features/order/presentation/widgets/build_summary_row.dart';
import 'package:foody/Features/order/presentation/widgets/order_product_card.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:get/get.dart';

class CartScreen extends GetView<AddNewOrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }

      if (controller.orderProducts.isEmpty) {
        return Center(child: Text('Cart is Empty'));
      }
      return WrapperIndicator(
        loading: controller.isLoading.value,
        child: Scaffold(
          appBar: AppBar(title: Text('Cart'), centerTitle: true),
          backgroundColor: AppColors.white100,
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: _buildContent(context),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.space16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: orderProductsList(context)),
          SizedBox(height: 10.0.h),
          // Promo Code Input
          Container(
            height: 60.0.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray100, // Border color
                width: 1.0, // Border width
              ),
              borderRadius: BorderRadius.circular(AppRadius.border28),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Promo Code',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 16.0.sp),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: AppSpacing.space20),
                    ),
                  ),
                ),
                SizedBox(width: 10.0.w),
                Padding(
                  padding: EdgeInsets.all(AppSpacing.space8),
                  child: Container(
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        snackBarCustom(
                            context, 'Invalid Promo Code', '', () {});
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppRadius.border24),
                        ),
                        backgroundColor: AppColors.orange100,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSpacing.space24),
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0.h),
          // Subtotal, Tax, Delivery, Total
          buildSummaryRow('Subtotal', '\$${controller.getTotalPrice()} USD'),
          buildSummaryRow('Delivery', '\$1.00 USD'),
          Divider(thickness: 1.0, color: AppColors.gray20),
          buildSummaryRow('Total (${controller.orderProducts.length})',
              '\$${controller.getTotalPrice() + 1.00} USD',
              isTotal: true),
          //   Spacer(),
          SizedBox(height: 20.0.h),
          // Checkout Button
          Container(
            height: 60.0.h,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => CheckoutScreen());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.border32),
                ),
                backgroundColor: AppColors.orange100,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.space16),
                elevation: 0,
              ),
              child: Text(
                'CHECKOUT',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderProductsList(BuildContext context) {
    return ListView.builder(
      itemCount: controller.orderProducts.length,
      itemBuilder: (context, index) {
        OrderProductEntity orderProductEntity = controller.orderProducts[index];

        return OrderProductCard(
          id: controller
              .getProductFromController(orderProductEntity.productID)
              .productId
              .toInt(),
          imageUrl:
              '${controller.getProductFromController(orderProductEntity.productID).productImage}',
          name: controller
              .getProductFromController(orderProductEntity.productID)
              .name,
          price: controller
              .getProductFromController(orderProductEntity.productID)
              .productPrice
              .toDouble(),
          quantity: orderProductEntity.productQuantity,
          index: index,
        );
      },
    );
  }
}
