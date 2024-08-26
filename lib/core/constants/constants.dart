import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff100B20);
const kTranstionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kProductsBox = 'products_box';
const authBox = "authBox";
const authToken = "authToken";
const currentUserData = "currentUserData";
const userLoggedIn = "userLoggedIn";

enum OrderStatusEnum {
  placed,
  processed,
  shipped,
  outForDelivery,
  delivered,
  cancelled,
}

enum PaymentMethodsEnum {
  stripe,
  cash,
}

extension OrderStatusEnumExtension on OrderStatusEnum {
  String get label {
    switch (this) {
      case OrderStatusEnum.placed:
        return "Order Placed";
      case OrderStatusEnum.processed:
        return "Order Processed";
      case OrderStatusEnum.shipped:
        return "Shipped";
      case OrderStatusEnum.outForDelivery:
        return "Out for Delivery";
      case OrderStatusEnum.delivered:
        return "Delivered";
      case OrderStatusEnum.cancelled:
        return "Cancelled";
      default:
        return "";
    }
  }

  bool get isCompleted {
    switch (this) {
      case OrderStatusEnum.delivered:
      case OrderStatusEnum.cancelled:
        return true;
      default:
        return false;
    }
  }
}

extension PaymentMethodsEnumExtension on PaymentMethodsEnum {
  String get label {
    switch (this) {
      case PaymentMethodsEnum.stripe:
        return "Stripe";
      case PaymentMethodsEnum.cash:
        return "Cash";
      default:
        return "";
    }
  }
}
