import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/hive_boxes/auth_box.dart';
import 'package:foody/core/services/app_services.dart';
import 'package:foody/core/theme/theme.dart';
import 'package:foody/screen_routes.dart';
import 'package:foody/screens_list.dart';
import 'package:get/get.dart';
import 'core/utils/size_config.dart';
import 'localization/local_controller.dart';
import 'localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialHive();
  initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    AppLocallcontroller localeController = Get.find<AppLocallcontroller>();

    return ScreenUtilInit(
      designSize: const Size(336, 727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => GetMaterialApp(
        locale: localeController.language,
        translations: AppTranslation(),
        initialRoute: AuthBox.isUserLoggedIn()
            ? ScreensRoutes.welcomeScreen // return to  ScreensRoutes.homeScreen
            : ScreensRoutes.welcomeScreen,
        getPages: ScreensList.screensList,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
      ),
    );
  }
}
