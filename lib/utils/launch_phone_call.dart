import 'package:driven_common/common/driven_constants.dart';
import 'package:driven_common/globals.dart';
import 'package:driven_common/utils/safe_launch.dart';

Future<void> launchPhoneCall(String url) async {
  if (await safeLaunchAsync(
    DrivenConstants.canLaunchPhoneCall,
    tryAction: () => Globals().canLaunch(url),
    catchAction: () => Future.value(false),
  )) {
    await safeLaunchAsync(
      DrivenConstants.launchPhoneCall,
      tryAction: () => Globals().launch(url),
      catchAction: () => Future.value(false),
    );
  }
}
