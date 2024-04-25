import 'package:driven_common/analytics/adobe_tags.dart';
import 'package:driven_common/analytics/configurations.dart';
import 'package:driven_common/globals.dart';

Map<String, Map<String, String>> _configurablePageFields(
  AnalyticsPlatform platform,
  AnalyticsAuthState authState,
) =>
    {
      'pageInfo': {
        ..._pageInfo(platform, authState),
      }
    };

Map<String, String> _pageInfo(
  AnalyticsPlatform platform,
  AnalyticsAuthState authState,
) =>
    {
      'platform': platform.value,
      'type': Globals().appFlavor,
      'authState': authState.value,
    };

void trackState(
  // AnalyticsScreenName screenName, {
  String screenNameValue,
  String screenSectionNameValue, {
  AnalyticsPlatform platform = AnalyticsPlatform.mobileApp,
  AnalyticsAuthState authState = AnalyticsAuthState.postLogin,
}) {
  _safeTrack(
    trackName: 'trackPage',
    trackFunction: () => Globals().analytics.trackPage({
      'eventType': 'web.webPageDetails.pageViews',
      'web': {
        'webPageDetails': {
          'name': screenNameValue,
          'siteSection': screenSectionNameValue,
          'pageViews': {
            'value': '1',
          }
        }
      },
      '_fleetcor': {
        ..._configurablePageFields(platform, authState),
        'customMetric': {
          'beacons': {
            'value': '1',
          },
          'pageviews': {
            'value': '1',
          },
        }
      },
    }),
  );
}

void trackAction(
  String actionName, {
  AnalyticsActionType actionType = AnalyticsActionType.buttonClick,
  String? adobeCustomTag,
}) {
  if (_isTrackEnabled(adobeCustomTag)) {
    _safeTrack(
      trackName: 'trackAction',
      trackFunction: () => Globals().analytics.trackAction({
        'eventType': 'web.webinteraction.linkClicks',
        'web': {
          'webInteraction': {
            'name': actionName,
            'type': 'other',
            'linkClicks': {
              'value': '1',
            },
          },
        },
        '_fleetcor': {
          'pageInfo': {
            'type': Globals().appFlavor,
          },
          'customMetric': {
            'beacons': {
              'value': '1',
            },
            'interactionDetails': {
              'type': actionType.value,
            }
          },
        },
      }),
    );
  }
}

void trackStatus(
  String requestUID,
  // AnalyticsScreenName screenName, {
  String screenNameValue, {
  bool isComplete = true,
  String? adobeCustomTag,
}) {
  if (_isTrackEnabled(adobeCustomTag)) {
    _safeTrack(
      trackName: 'trackAction',
      trackFunction: () => Globals().analytics.trackAction({
        'eventType': 'web.webinteraction.linkClicks',
        'web': {
          'webInteraction': {
            'name': isComplete ? 'Form/API Completed' : 'Form/API Failure',
            'type': screenNameValue,
            'linkClicks': {
              'value': '1',
            },
          },
        },
        '_fleetcor': {
          'pageInfo': {
            'type': Globals().appFlavor,
          },
          'apiDetails': {
            isComplete ? 'completes' : 'failure': {'value': '1'},
          },
          'customMetric': {
            'beacons': {
              'value': '1',
            },
          },
          'formDetails': {
            'form': {
              'refNumber': requestUID,
            }
          }
        },
      }),
    );
  }
}

bool _isTrackEnabled(String? adobeCustomTag) {
  bool isTrackEnabled = true;
  if (adobeCustomTag != null) {
    isTrackEnabled = AdobeTags().isAdobeTagEnabled(adobeCustomTag);
  }
  return isTrackEnabled;
}

void _safeTrack({
  required String trackName,
  required Function() trackFunction,
}) {
  try {
    trackFunction();
  } catch (error) {
    Globals().dynatrace.logError(
          name: 'Adobe $trackName error',
          value: error.toString(),
        );
  }
}
