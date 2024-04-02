import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/themes/app_text.dart';
import './splash_screen_view_model.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (SplashScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SplashScreenViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            // backgroundColor: warningColor,
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 100,
                      ),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'KAMUS ISTILAH KESEHATAN',
                      style: boldTextStyle.copyWith(
                        // color: backgroundColor,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    // Text(
                    //   '(Survei App)',
                    //   style: boldTextStyle.copyWith(
                    //     // color: backgroundColor,
                    //     fontStyle: FontStyle.italic,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    const Expanded(child: SizedBox()),
                    Text(
                      'Created By',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Rahmat Hidayat Syam',
                      style: boldTextStyle.copyWith(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '217280019',
                      style: boldTextStyle.copyWith(
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
