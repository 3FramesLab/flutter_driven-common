import 'package:driven_common/analytics/aep_core.dart';
import 'package:driven_common/analytics/driven_analytics.dart';
import 'package:driven_common/dynatrace/driven_dynatrace.dart';

class Globals {
  late DrivenDynatrace dynatrace;
  late AEPCore analytics;
  late String appFlavor;

  void init({required String flavor}) {
    appFlavor = flavor;
    initializeAnalytics();
    initializeDynatrace();
  }

  void initializeAnalytics() {
    analytics = DrivenAnalytics();
  }

  void initializeDynatrace() {
    dynatrace = DrivenDynatrace.init();
  }
}
