import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../services/my_tts.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  final myTts = locator<MyTts>();
  Future<void> init() async {
    await myTts.init();
    // await 3 seconds then go to login
    // await Future.delayed(const Duration(seconds: 3));
    await navigationService.navigateTo(Routes.userTrackingIndexView);
  }
}
