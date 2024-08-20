import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/payment/presentation/manger/payment_state.dart';
import 'package:foody/Features/payment/presentation/widgets/payment_method_item.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';

class PaymentMethodsListView extends StatelessWidget {
  final PaymentController paymentController;
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  PaymentMethodsListView({super.key, required this.paymentController});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: ListView.builder(
          itemCount: paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space8),
              child: GestureDetector(
                onTap: () {
                  paymentController.activeIndex.value = index;
                },
                child: Obx(
                  () => PaymentMethodItem(
                    isActive: paymentController.activeIndex.value == index,
                    image: paymentMethodsItems[index],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
