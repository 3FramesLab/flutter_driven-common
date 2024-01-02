import 'package:driven_common/analytics/aep_core.dart';
import 'package:driven_common/analytics/driven_analytics.dart';
import 'package:driven_common/dynatrace/driven_dynatrace.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Globals {
  late DrivenDynatrace dynatrace;
  late AEPCore analytics;
  late String appFlavor;
  late bool isCardHolderLogin;
  late bool isComdata;
  late String packageId;
  late String androidCertSignature;
  late SharedPreferences sharedPreferences;

  void init({required String flavor, bool isCardHolderLogin = false}) async {
    appFlavor = flavor;
    isCardHolderLogin = isCardHolderLogin;
    initializeAnalytics();
    initializeDynatrace();
    await initializeSharedPreferences();
  }

  void initializeAnalytics() {
    analytics = DrivenAnalytics();
  }

  void initializeDynatrace() {
    dynatrace = DrivenDynatrace.init();
  }

  Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
