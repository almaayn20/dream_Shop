import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foody/Features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:foody/Features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/data/models/payment_intent_model/payment_intent_model.dart';

import '../../../../core/utils/api_service.dart';

abstract class PaymentRemoteDataSource {
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  final ApiService apiService;

  PaymentRemoteDataSourceImpl(this.apiService);

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.paymentPost(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: dotenv.env['STRIPE_SECRET_KEY']!,
    );
    var jsonResponse =
        jsonDecode(response.body); // Parse the response body into a JSON object
    var paymentIntentModel = PaymentIntentModel.fromJson(jsonResponse);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initiPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initiPaymentSheetInputModel.customerId,
        //to do : change name to user name
        merchantDisplayName: 'Salman',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.paymentPost(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: dotenv.env['STRIPE_SECRET_KEY']!,
        headers: {
          'Authorization': "Bearer ${dotenv.env['STRIPE_SECRET_KEY']!}",
          'Stripe-Version': '2023-08-16',
        });
    var jsonResponse =
        jsonDecode(response.body); // Parse the response body into a JSON object

    var ephermeralKey = EphemeralKeyModel.fromJson(jsonResponse);

    return ephermeralKey;
  }

  @override
  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntentInputModel.cusomerId);
    var initPaymentSheetInputModel = InitiPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.cusomerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initiPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }
}
