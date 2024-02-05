import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie/CustomWidgets/CustomDivider/custom_divider.dart';
import 'package:movie/CustomWidgets/DrawerItem/drawer_item.dart';
import 'package:movie/Routes/app_navigation.dart';
import 'package:movie/Routes/app_navigation_routes.dart';
import 'package:movie/Utils/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerItem(title: "Movies", onPress: () {}),
          const CustomDivider(),
          Gap(3.h),
          DrawerItem(
              icon: Icon(Icons.favorite),
              iconColor: AppColors.redColor,
              title: 'My Favourite Movies',
              onPress: () {
                AppNavigation.navigateTo(
                    routeName: AppNavRoutes.favMovieListScreen);
              })
        ],
      ),
    );
  }
}
