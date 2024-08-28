import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:timelines/timelines.dart';

class DeliveryProcesses extends StatelessWidget {
  final OrderStatusEnum orderStatus;
  const DeliveryProcesses({Key? key, required this.orderStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.space12),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          color: AppColors.gray100,
          indicatorTheme: IndicatorThemeData(
            position: 0,
            size: 25.0,
          ),
          connectorTheme: ConnectorThemeData(
            space: 5.5,
            thickness: 3.5,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: OrderStatusEnum.values.length - 1,
          contentsBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.only(left: AppSpacing.space8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    OrderStatusEnum.values[index].label,
                    style: DefaultTextStyle.of(context).style.copyWith(
                          fontSize: 16.0.sp,
                        ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            );
          },
          indicatorBuilder: (_, index) {
            if (orderStatus.index >= index) {
              return DotIndicator(
                color: OrderStatusEnum.values[index].isCompleted
                    ? Colors.green
                    : AppColors.orange100,
                child: Icon(
                  Icons.check,
                  color: AppColors.white100,
                  size: 12.0.sp,
                ),
              );
            } else {
              return OutlinedDotIndicator(
                borderWidth: 2.5,
              );
            }
          },
          connectorBuilder: (_, index, ___) => SolidLineConnector(
            color:
                OrderStatusEnum.values[index].isCompleted ? Colors.green : null,
          ),
        ),
      ),
    );
  }
}
