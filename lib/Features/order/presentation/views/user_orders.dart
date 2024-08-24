import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/home/presentation/manger/home_navigation_state.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/manger/get_user_orders_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Orders',
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: LastedOrders(),
        ),
      ),
    );
  }
}

class LastedOrders extends GetView<GetUserOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.errorMessage.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }

      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.separated(
        itemCount: controller.userOrders.length,
        itemBuilder: (context, index) {
          return OrderCard(userOrdersController: controller, index: index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 20.0.h); // Adjust the height to your needs
        },
      );
    });
  }
}

class OrderCard extends StatelessWidget {
  final GetUserOrdersController userOrdersController;
  final int index;

  const OrderCard(
      {super.key, required this.userOrdersController, required this.index});
  @override
  Widget build(BuildContext context) {
    final AddNewOrderController addNewOrderController = Get.find();
    final HomeNavigationController homeNavigationController = Get.find();

    final OrderResponseEntity order = userOrdersController.userOrders[index];
    DateTime orderDate =
        DateTime.parse(userOrdersController.userOrders[index].orderDate);
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(orderDate);

    return Container(
      padding: EdgeInsets.all(AppSpacing.space16),
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.space20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.border20),
        boxShadow: [
          BoxShadow(
            color: AppColors.dark100,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$formattedDate - ${order.orderProducts.length} items',
                        style: TextStyle(
                          color: AppColors.gray80,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Order ID: ${order.orderId}",
                        style: TextStyle(
                          color: AppColors.dark100,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 16),
                          SizedBox(width: 4.w),
                          Text(
                            "Order Delivered",
                            style:
                                TextStyle(color: Colors.green, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 13.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.white100),
                  foregroundColor: MaterialStateProperty.all(AppColors.dark100),
                ),
                child: Text('Details'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.orange100),
                  foregroundColor:
                      MaterialStateProperty.all(AppColors.white100),
                ),
                onPressed: () {
                  for (var e in order.orderProducts) {
                    addNewOrderController.addOrderProduct(e);
                  }
                  addNewOrderController.addProductPricesToList();
                  homeNavigationController.onItemTapped(1);
                  Get.offNamed(ScreensRoutes.cartScreen);
                },
                child: Text('Re-Order'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
