import 'package:flutter/material.dart';
import 'package:kamus_kesehatan/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import './user_tracking_index_view_model.dart';

class UserTrackingIndexView extends StatelessWidget {
  const UserTrackingIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserTrackingIndexViewModel>.reactive(
      viewModelBuilder: () => UserTrackingIndexViewModel(),
      onViewModelReady: (UserTrackingIndexViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        UserTrackingIndexViewModel model,
        Widget? child,
      ) {
        return SafeArea(
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: mainColor,
                title: Text(
                  model.header,
                  style: const TextStyle(
                    color: fontColor,
                    fontSize: 20,
                  ),
                ),
                elevation: 0,
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                    onPressed: () {
                      model.exitApp();
                    },
                    icon: const Icon(Icons.logout, color: fontColor),
                  ),
                ],
              ),
              extendBody: false,
              body: ExtendedNavigator(
                router: UserTrackingIndexViewRouter(),
                navigatorKey: StackedService.nestedNavigationKey(2),
                initialRoute: UserTrackingIndexViewRoutes.halamanUtamaView,
              ),
              bottomNavigationBar: StylishBottomBar(
                items: [
                  for (var item in model.bottomNavBarList)
                    BottomBarItem(
                      icon: Icon(item['icon'],
                          color: model.currentIndex ==
                                  model.bottomNavBarList.indexOf(item)
                              ? mainColor
                              : fontColor),
                      title: Text(
                        item['name'],
                        style: regularTextStyle.copyWith(
                          color: model.currentIndex ==
                                  model.bottomNavBarList.indexOf(item)
                              ? mainColor
                              : fontColor,
                        ),
                        // textAlign: TextAlign.l,
                      ),
                      backgroundColor: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? fontColor
                          : fontColor,
                    ),
                ],
                currentIndex: model.currentIndex,
                option: BubbleBarOptions(),
                hasNotch: true,
                backgroundColor: mainColor,
                onTap: (value) {
                  model.handleNavigation(value);
                },
                // fabLocation: StylishBarFabLocation.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
