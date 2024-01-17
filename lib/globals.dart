import 'package:driven_common/analytics/aep_core.dart';
import 'package:driven_common/analytics/driven_analytics.dart';
import 'package:driven_common/dynatrace/driven_dynatrace.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart' as url_launcher;

class Globals {
  static final Globals _singleton = Globals._internal();
  factory Globals() => _singleton;
  Globals._internal();

  late DrivenDynatrace dynatrace;
  late AEPCore analytics;
  late String appFlavor;
  late bool isCardHolderLogin;
  late bool isComdata;
  late String packageId;
  late String androidCertSignature;
  late SharedPreferences sharedPreferences;
  late Future<bool> Function(String, {LaunchMode mode}) launch;
  late Future<bool> Function(String) canLaunch;

  void init({required String flavor, bool isCardHolderLogin = false}) async {
    appFlavor = flavor;
    isCardHolderLogin = isCardHolderLogin;
    initializeAnalytics();
    initializeDynatrace();
    await initializeSharedPreferences();
    launch = url_launcher.launchUrlString;
    canLaunch = url_launcher.canLaunchUrlString;
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
