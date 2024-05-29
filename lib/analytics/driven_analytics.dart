import 'dart:async';

import 'package:driven_common/analytics/aep_core.dart';
import 'package:driven_common/globals.dart';
import 'package:flutter_aepedge/flutter_aepedge.dart';

class DrivenAnalytics implements AEPCore {
  @override
  Future<void> trackAction(
    Map<String, dynamic>? data,
  ) async {
    if (Globals().isProdEnvironment) {
      final ExperienceEvent experienceEvent =
          ExperienceEvent({'xdmData': data});
      await Edge.sendEvent(experienceEvent);
    }
  }

  @override
  Future<void> trackPage(Map<String, dynamic>? data) async {
    if (Globals().isProdEnvironment) {
      final ExperienceEvent experienceEvent =
          ExperienceEvent({'xdmData': data});
      await Edge.sendEvent(experienceEvent);
    }
  }
}
