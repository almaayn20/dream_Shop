import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/Features/home/data/models/home_navigation_model.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class BottomTabBar extends GetView {
  final List<HomeNavigationModel> pages;
  final int selectedIndex;
  final Function(int index) onItemTapped;
  final String badgeText;

  const BottomTabBar(
      {Key? key,
      required this.pages,
      required this.selectedIndex,
      required this.onItemTapped,
      required this.badgeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: AppSpacing.space12),
      decoration: const BoxDecoration(
        boxShadow: AppShadow.bottomTab,
        color: AppColors.white100,
      ),
      // padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: BottomNavigationBar(
        currentIndex: selectedIndex, //New
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: pages
            .asMap()
            .entries
            .map(
              (entries) => BottomNavigationBarItem(
                icon: TabBarIcon(
                  entries.value.icon,
                  active: entries.key == selectedIndex,
                  badgeText: badgeText,
                ),
                label: '',
              ),
            )
            .toList(),
      ),
    );
  }
}

class TabBarIcon extends StatelessWidget {
  final String path;
  final bool active;
  final String badgeText;
  final Color activeColor;
  final Color inactiveColor;
  TabBarIcon(
    this.path, {
    Key? key,
    required this.active,
    required this.badgeText,
    this.activeColor = AppColors.orange100,
    this.inactiveColor = AppColors.gray50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 24.w,
        height: 24.w,
        child: badges.Badge(
          badgeStyle: badges.BadgeStyle(badgeColor: AppColors.orange100),
          showBadge: path == 'assets/icons/cart_tab.svg' ? true : false,
          badgeContent: Text(
            badgeText,
            style: TextStyle(color: AppColors.white100),
          ),
          child: SvgPicture.asset(
            path,
            width: 24.w,
            height: 24.w,
            color: active ? activeColor : inactiveColor,
          ),
        ));
  }
}
