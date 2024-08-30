import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:foody/Features/category/presentation/widgets/category_container.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesList extends GetView<CategoriesController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 128.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected = controller.currentCategoryId ==
                controller.categories[index].categoryTitle;

            return categoryWidget(index, isSelected);
          },
          itemCount: controller.categories.length,
        ),
      ),
    );
  }

  Row categoryWidget(int index, bool isSelected) {
    return Row(
      children: [
        index == 0
            ? SizedBox(
                width: 16.w,
              )
            : const SizedBox(),
        GestureDetector(
          onTap: () => controller
              .onSelectCategory(controller.categories[index].categoryTitle),
          child: CategoryContainer(
            isSelected: isSelected,
            controller: controller,
            index: index,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}
