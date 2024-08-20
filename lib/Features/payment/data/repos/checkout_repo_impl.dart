import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foody/Features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/domain/repos/checkout_repo.dart';
import 'package:foody/core/errors/failure.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final PaymentRemoteDataSource paymentRemoteDataSource;

  CheckoutRepoImpl(this.paymentRemoteDataSource);

  @override
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      await paymentRemoteDataSource.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return Right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(e.error.message ?? 'Oops there was an error'));
    } on StripeConfigException catch (e) {
      return left(ServerFailure('Stripe configuration error: ${e.message}'));
    } catch (e) {
      if (e is HttpException) {
        return Left(ServerFailure(e.toString()));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
