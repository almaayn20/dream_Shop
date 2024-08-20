import 'package:flutter/material.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/presentation/widgets/payment_methods_bottom_sheet.dart';
import 'package:foody/core/constants/radius.dart';

class cc extends StatelessWidget {
  const cc({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Complete Payment'),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.border16)),
            builder: (context) {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: '100',
                currency: 'USD',
                cusomerId: 'cus_Qgb7uqO7CklSbO',
              );
              return PaymentMethodsBottomSheet(
                  paymentIntentInputModel: paymentIntentInputModel);
            });
      },
    );
  }
}
