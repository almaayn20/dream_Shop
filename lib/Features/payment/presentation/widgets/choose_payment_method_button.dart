import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/presentation/manger/payment_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';

class ChoosePaymentMethodButton extends StatelessWidget {
  final PaymentController paymentController;
  final PaymentIntentInputModel paymentIntentInputModel;

  const ChoosePaymentMethodButton(
      {super.key,
      required this.paymentController,
      required this.paymentIntentInputModel});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 60.0.h,
        width: 120.w,
        child: ElevatedButton(
          onPressed: () {
            paymentController.makeStripePayment(paymentIntentInputModel);
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
                  'Continue',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white100,
                  ),
                ),
        ),
      ),
    );
  }
}
