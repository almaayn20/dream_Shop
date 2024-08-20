import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/presentation/manger/payment_state.dart';
import 'package:foody/Features/payment/presentation/widgets/choose_payment_method_button.dart';
import 'package:foody/Features/payment/presentation/widgets/payment_methods_list_view.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:get/get.dart';

class PaymentMethodsBottomSheet extends GetView<PaymentController> {
  const PaymentMethodsBottomSheet(
      {super.key, required this.paymentIntentInputModel});
  final PaymentIntentInputModel paymentIntentInputModel;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.errorMessage.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          snackBarCustom(context, controller.errorMessage.value, '', () {});
          Future.delayed(Duration(milliseconds: 300), () {
            Get.back();
          });
          controller.errorMessage.value = '';
        });
      }
      return Padding(
        padding: EdgeInsets.all(AppSpacing.space16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            PaymentMethodsListView(
              paymentController: controller,
            ),
            SizedBox(
              height: 32.h,
            ),
            ChoosePaymentMethodButton(
              paymentController: controller,
              paymentIntentInputModel: paymentIntentInputModel,
            ),
          ],
        ),
      );
    });
  }
}
