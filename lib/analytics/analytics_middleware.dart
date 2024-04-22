import 'package:driven_common/analytics/analytics_trackers.dart';
import 'package:driven_common/analytics/configurations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsMiddleware extends GetMiddleware {
  AnalyticsScreenName screenName;
  AnalyticsPlatform platform;
  AnalyticsLineOfBusiness lineOfBusiness;
  AnalyticsAuthState authState;

  AnalyticsMiddleware(
    this.screenName, {
    this.platform = AnalyticsPlatform.mobileApp,
    this.lineOfBusiness = AnalyticsLineOfBusiness.comdata,
    this.authState = AnalyticsAuthState.postLogin,
  });

  @override
  Widget onPageBuilt(Widget page) {
    // Run Async so we don't wait.
    Future(() => trackState(
          screenName,
          platform: platform,
          authState: authState,
        ));
    return page;
  }
}
