// part of data_module;

// void trackApiStatus({
//   required bool isSuccess,
//   required AnalyticsScreenName? analyticsScreenName,
//   required RequestOptions requestOption,
//   required APIType apiType,
// }) {
//   if (analyticsScreenName == null) {
//     return;
//   }
//   final httpMethod = requestOption.method;
//   String apiStatusMessage = isSuccess ? ': success' : ': failure';
//   bool invokeTrackStatus = true;
//   switch (apiType) {
//     case APIType.factors:
//       apiStatusMessage =
//           'API : $httpMethod/users/{userId}/factors $apiStatusMessage';
//       break;
//     case APIType.mfaLogs:
//       apiStatusMessage = 'API : $httpMethod/mfalongs $apiStatusMessage';
//       break;
//     case APIType.user:
//       apiStatusMessage = 'API : $httpMethod/users $apiStatusMessage';
//       break;
//     case APIType.verifyCode:
//       apiStatusMessage =
//           'API : $httpMethod/authn/factors/verify $apiStatusMessage';
//       break;
//     case APIType.securityQuestion:
//       apiStatusMessage =
//           'API : $httpMethod/factors/questions $apiStatusMessage';
//       break;
//     case APIType.siteLocationsDistanceMatrix:
//     case APIType.siteLocationsPlacesAutoComplete:
//     case APIType.siteLocationsGeoCoding:
//     case APIType.sitesBrandLogoUrls:
//       invokeTrackStatus = false;
//       break;
//     default:
//       apiStatusMessage =
//           'API : $httpMethod${requestOption.path} $apiStatusMessage';
//   }

//   if (invokeTrackStatus) {
//     trackStatus(
//       apiStatusMessage,
//       analyticsScreenName,
//       isComplete: isSuccess,
//     );
//   }
// }
