import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/home/presentation/manger/home_navigation_state.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/widgets/build_summary_row.dart';
import 'package:foody/Features/order/presentation/widgets/location_card.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/presentation/manger/payment_state.dart';
import 'package:foody/Features/payment/presentation/widgets/payment_methods_list_view.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/back.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends GetView<AddNewOrderController> {
  CheckoutScreen({super.key});

  final PaymentController paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
          centerTitle: true,
          leading: GetBackCustom(),
        ),
        backgroundColor: AppColors.white100,
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: WrapperIndicator(
              loading: controller.isLoading.value,
              child: _buildContent(context)),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    final HomeNavigationController homeNavigationController = Get.find();

    return Padding(
      padding: EdgeInsets.all(AppSpacing.space16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping to:',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark80,
                ),
              ),
              LocationCard(),
              SizedBox(height: 10.0.h),
              Text(
                'Payment Method:',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark80,
                ),
              ),
              SizedBox(height: 10.0.h),

              PaymentMethodsListView(
                paymentController: paymentController,
              ),
              SizedBox(height: 20.0.h),
              // Subtotal, Tax, Delivery, Total
              buildSummaryRow(
                  'Subtotal', '\$${controller.getTotalPrice()} USD'),
              buildSummaryRow('Delivery', '\$1.00 USD'),
              Divider(thickness: 1.0, color: AppColors.gray20),
              buildSummaryRow('Total (${controller.orderProducts.length})',
                  '\$${controller.getTotalPrice() + 1.00} USD',
                  isTotal: true),
              //   Spacer(),
              SizedBox(height: 20.0.h),

              // complete purchace Button
            ],
          ),
          Container(
            height: 60.0.h,
            child: ElevatedButton(
              onPressed: () async {
                String totalPrice = ((controller.getTotalPrice() + 1.00) * 100)
                    .round()
                    .toString();
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                  amount: totalPrice,
                  currency: 'USD',
                  cusomerId: 'cus_Qgb7uqO7CklSbO',
                );
                await paymentController
                    .makeStripePayment(paymentIntentInputModel);
                if (paymentController.errorMessage.isNotEmpty) {
                  snackBarCustom(
                      context, paymentController.errorMessage.value, '', () {});
                  //   paymentController.errorMessage.value = '';
                } else {
                  String orderDate =
                      DateFormat('yyyy-MM-dd').format(DateTime.now());
                  OrderEntity orderEntity = OrderEntity(
                      userID: 109,
                      orderDate: orderDate,
                      orderProducts: controller.orderProducts);
                  await controller.addNewOrder(orderEntity);
                  if (controller.errorMessage.isNotEmpty) {
                    snackBarCustom(
                        context, controller.errorMessage.value, '', () {});
                  } else {
                    snackBarCustom(
                        context, 'Order Completed Successfuly', '', () {});
                    homeNavigationController.onItemTapped(2);
                    //    Get.offNamed(ScreensRoutes.userOrdersScreen);
                    Get.offNamedUntil(
                      ScreensRoutes.homeScreen,
                      (route) =>
                          route.isFirst ||
                          Get.previousRoute == Get.currentRoute,
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.border32),
                ),
                backgroundColor: AppColors.orange100,
                padding: EdgeInsets.symmetric(vertical: AppSpacing.space16),
                elevation: 0,
              ),
              child: paymentController.isLoading.value
                  ? CircularProgressIndicator()
                  : Text(
                      'Complete Purchase',
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
}
