import 'package:driven_common/analytics/configurations.dart';
import 'package:driven_common/globals.dart';

Map<String, Map<String, String>> _configurablePageFields(
  AnalyticsPlatform platform,
  AnalyticsAuthState authState,
  AnalyticsLineOfBusiness lineOfBusiness,
  String flavor,
) =>
    {
      'pageInfo': {
        ..._pageInfo(platform, authState, lineOfBusiness, flavor),
      }
    };

Map<String, String> _pageInfo(
  AnalyticsPlatform platform,
  AnalyticsAuthState authState,
  AnalyticsLineOfBusiness lineOfBusiness,
  String flavor,
) =>
    {
      'platform': platform.value,
      'type': flavor,
      'authState': authState.value,
    };

void trackState(
  AnalyticsScreenName screenName, {
  AnalyticsPlatform platform = AnalyticsPlatform.mobileApp,
  AnalyticsLineOfBusiness lineOfBusiness = AnalyticsLineOfBusiness.comdata,
  AnalyticsAuthState authState = AnalyticsAuthState.postLogin,
  String flavor = 'default',
}) {
  _safeTrack(
    trackName: 'trackPage',
    trackFunction: () => Globals().analytics.trackPage({
      'eventType': 'web.webPageDetails.pageViews',
      'web': {
        'webPageDetails': {
          'name': screenName.value,
          'siteSection': screenName.section.value,
          'pageViews': {
            'value': '1',
          }
        }
      },
      '_fleetcor': {
        ..._configurablePageFields(platform, authState, lineOfBusiness, flavor),
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
  AnalyticsLineOfBusiness lineOfBusiness = AnalyticsLineOfBusiness.comdata,
  String flavor = 'default',
}) {
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
          'type': flavor,
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

void trackStatus(
  String requestUID,
  AnalyticsScreenName screenName, {
  AnalyticsLineOfBusiness lineOfBusiness = AnalyticsLineOfBusiness.comdata,
  bool isComplete = true,
  String flavor = 'default',
}) {
  _safeTrack(
    trackName: 'trackAction',
    trackFunction: () => Globals().analytics.trackAction({
      'eventType': 'web.webinteraction.linkClicks',
      'web': {
        'webInteraction': {
          'name': isComplete ? 'Form/API Completed' : 'Form/API Failure',
          'type': screenName.value,
          'linkClicks': {
            'value': '1',
          },
        },
      },
      '_fleetcor': {
        'pageInfo': {
          'type': flavor,
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
