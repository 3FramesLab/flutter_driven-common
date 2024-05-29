import 'package:driven_common/analytics/analytics_trackers.dart';
import 'package:driven_common/analytics/configurations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsMiddleware extends GetMiddleware {
  // AnalyticsScreenName screenName;
  String screenNameValue;
  String screenSectionNameValue;
  AnalyticsPlatform platform;
  AnalyticsAuthState authState;

  AnalyticsMiddleware(
    // this.screenName, {
    this.screenNameValue,
    this.screenSectionNameValue, {
    this.platform = AnalyticsPlatform.mobileApp,
    this.authState = AnalyticsAuthState.postLogin,
  });

  @override
  Widget onPageBuilt(Widget page) {
    // Run Async so we don't wait.
    Future(() => trackState(
          // screenName,
          screenNameValue,
          screenSectionNameValue,
          platform: platform,
          authState: authState,
        ));
    return page;
  }
}
