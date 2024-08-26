import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/manger/track_order_state.dart';
import 'package:foody/Features/order/presentation/widgets/delivery_processes.dart';
import 'package:foody/Features/order/presentation/widgets/order_product_card.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';

class TrackOrderScreen extends GetView<TrackOrderController> {
  final AddNewOrderController addNewOrderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Track Order',
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(AppSpacing.space16),
          child: ListView(
            children: [
              _buildOrderInfo(controller),
              SizedBox(height: 16.h),
              ExpansionTile(
                  collapsedBackgroundColor: AppColors.orange100,
                  title: Text('Order Status',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  initiallyExpanded: true,
                  children: const [
                    DeliveryProcesses(),
                  ]),
              SizedBox(height: 16.h),
              ExpansionTile(
                  collapsedBackgroundColor: AppColors.orange100,
                  title: Text('Order Products',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  initiallyExpanded: false,
                  children: [
                    orderProductsList(context),
                  ]),
            ],
          ),
        ));
  }

  Widget orderProductsList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), // Disable scrolling

      itemCount: controller.order.orderProducts.length,
      itemBuilder: (context, index) {
        OrderProductEntity orderProductEntity =
            controller.order.orderProducts[index];

        return OrderProductCard(
            id: addNewOrderController
                .getProductFromController(orderProductEntity.productID)
                .productId
                .toInt(),
            imageUrl:
                '${addNewOrderController.getProductFromController(orderProductEntity.productID).productImage}',
            name: addNewOrderController
                .getProductFromController(orderProductEntity.productID)
                .name,
            price: addNewOrderController
                .getProductFromController(orderProductEntity.productID)
                .productPrice
                .toDouble(),
            quantity: orderProductEntity.productQuantity,
            index: index,
            isCartProduct: false);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 25.h,
        );
      },
    );
  }

  Widget _buildOrderInfo(TrackOrderController controller) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: AppColors.white100,
        borderRadius: BorderRadius.circular(AppRadius.border10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.gray20,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: ${controller.order.orderId}',
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.orange100,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.h),
          Text(
            'Order Date: ${controller.formattedOrderDate}',
            style: TextStyle(fontSize: 16.sp, color: AppColors.gray150),
          ),
          SizedBox(height: 4.h),
          Text(
            'Payment Method: ${controller.order.paymentMethod?.toString().split('.').last ?? 'N/A'}',
            style: TextStyle(fontSize: 16.sp, color: AppColors.gray150),
          ),
        ],
      ),
    );
  }
}
