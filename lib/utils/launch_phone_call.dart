import 'package:driven_common/common/driven_constants.dart';
import 'package:driven_common/utils/safe_launch.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchPhoneCall(String url) async {
  if (await safeLaunchAsync(
    DrivenConstants.canLaunchPhoneCall,
    tryAction: () => canLaunchUrlString(url),
    catchAction: () => Future.value(false),
  )) {
    await safeLaunchAsync(
      DrivenConstants.launchPhoneCall,
      tryAction: () => launchUrlString(url),
      catchAction: () => Future.value(false),
    );
  }
}
