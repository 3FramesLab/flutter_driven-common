part of data_module;

enum APIType {
  loginAuth,
  factors,
  resetMFAFactors,
  mfaLogs,
  user,
  token,
  sendCode, //Login flow
  verifyCode, //Login flow
  usersSendCode, //Registration, Forgot Password flow
  usersVerifyCode, //Registration, Forgot Password flow
  createPassword,
  securityQuestion,
  sendCodeForMFASetup, //setup MFA
  activateMFASetup, //setup MFA
  createNewPassword,
  setupSecurityQuestion,
  acceptTermsOfService,
  checkTermsOfServiceStatus,
  rewards,
  siteLocatorAccessToken,
  siteLocations,
  siteLocationsDistanceMatrix,
  siteLocationsPlacesAutoComplete,
  siteLocationsGeoCoding,
  sitesBrandLogoUrls,
  oktaAuthn,
  oktaAuthorize,
  oktaToken,
  oktaGetUserDetails,
  oktaChangePassword,
  oktaSearchUser,
  oktaResetPassword,
  oktaRevokeAccessToken,
  oktaRevokeRefreshToken,
  oktaCreateUser,
  // Below for test coverage
  get,
  noPath,
  post,
  put,
  patch,
  delete,
}

class APIRoute implements APIRouteConfigurable {
  final APIType type;
  final String? routeParams;
  final String? headerQueryParams;
  bool headerQueryParameters;
  final String? directUrl;
  final Map<String, dynamic>? headerQueryParamsMap;

  static const String adminSiteLocationsPath = '/site/locations/summary';
  static const String cardholderSiteLocationsPath =
      '/site/locations/comdata/summary';

  final headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  final apiKeySecurityHeaders = {
    'X-Android-Package': Globals().packageId,
    'X-Android-Cert': Globals().androidCertSignature,
    'x-ios-bundle-identifier': Globals().packageId,
  };

  APIRoute(
    this.type, {
    this.routeParams,
    this.headerQueryParams,
    this.headerQueryParameters = false,
    this.directUrl,
    this.headerQueryParamsMap,
  });

  /// Return config of api (method, url, header)
  @override
  // ignore: long-method
  RequestOptions? getConfig() {
    switch (type) {
      case APIType.loginAuth:
        return loginAuth();
      case APIType.factors:
        return factors();
      case APIType.mfaLogs:
        return mfaLogs();
      case APIType.user:
        return user();
      case APIType.token:
        return token();
      case APIType.resetMFAFactors:
        return resetMFAFactors();
      case APIType.securityQuestion:
        return securityQuestion();
      case APIType.sendCode:
        return sendCode();
      case APIType.verifyCode:
        return verifyCode();
      case APIType.usersSendCode:
        return usersSendCode();
      case APIType.usersVerifyCode:
        return usersVerifyCode();
      case APIType.createPassword:
        return createPassword();
      case APIType.sendCodeForMFASetup:
        return sendCodeForMFASetup();
      case APIType.activateMFASetup:
        return activateMFASetup();
      case APIType.createNewPassword:
        return createNewPassword();
      case APIType.setupSecurityQuestion:
        return setupSecurityQuestion();
      case APIType.acceptTermsOfService:
        return acceptTermsOfService();
      case APIType.checkTermsOfServiceStatus:
        return checkTermsOfServiceStatus();
      case APIType.rewards:
        return getRewardsUrl();
      case APIType.siteLocatorAccessToken:
        return siteLocatorAccessToken();
      case APIType.siteLocations:
        return siteLocations();
      case APIType.siteLocationsDistanceMatrix:
        return siteLocationsDistanceMatrix(directUrl);
      case APIType.siteLocationsPlacesAutoComplete:
        return siteLocationsPlacesAutoComplete(directUrl);
      case APIType.siteLocationsGeoCoding:
        return siteLocationsGeoCoding(directUrl);
      case APIType.sitesBrandLogoUrls:
        return sitesBrandLogoUrls();
      case APIType.oktaAuthn:
        return oktaAuthn();
      case APIType.oktaAuthorize:
        return oktaAuthorize();
      case APIType.oktaToken:
        return oktaToken();
      case APIType.oktaGetUserDetails:
        return oktaGetUserDetails();
      case APIType.oktaResetPassword:
        return oktaResetPassword();
      case APIType.oktaSearchUser:
        return oktaSearchUser();
      case APIType.oktaRevokeAccessToken:
        return oktaRevokeToken();
      case APIType.oktaChangePassword:
        return oktaChangePassword();
      case APIType.oktaRevokeRefreshToken:
        return oktaRevokeToken();
      case APIType.oktaCreateUser:
        return oktaCreateUser();

      case APIType.get:
        return get();
      case APIType.post:
        return post();
      case APIType.put:
        return put();
      case APIType.patch:
        return patch();
      case APIType.delete:
        return delete();

      default:
        return null;
    }
  }

  RequestOptions createPassword() {
    return RequestOptions(
      path: '/okta/users/credentials/forgot_password',
      method: APIMethod.post,
    );
  }

  RequestOptions usersVerifyCode() {
    return RequestOptions(
      path: '/users/factors/verify',
      method: APIMethod.post,
    );
  }

  RequestOptions usersSendCode() {
    return RequestOptions(
      path: '/users/factors/send',
      method: APIMethod.post,
    );
  }

  RequestOptions verifyCode() {
    return RequestOptions(
      path: routeParams != null
          ? '/authn/factors/verify?$routeParams'
          : '/authn/factors/verify',
      method: APIMethod.post,
      headers: headerQueryParameters
          ? {'x-device-token': '$headerQueryParams'}
          : {'x-device-token': ''},
    );
  }

  RequestOptions sendCode() {
    return RequestOptions(
      path: '/authn/factors/send',
      method: APIMethod.post,
    );
  }

  RequestOptions securityQuestion() {
    return RequestOptions(
      path: '/okta/users/$routeParams/factors/questions',
      method: APIMethod.get,
    );
  }

  RequestOptions token() {
    return RequestOptions(
      path: '/token',
      method: APIMethod.post,
    );
  }

  RequestOptions resetMFAFactors() {
    return RequestOptions(
      path: '/okta/users/lifecycle/reset_factors',
      method: APIMethod.post,
    );
  }

  RequestOptions user() {
    return RequestOptions(
      path: '/okta/users=$routeParams',
      method: APIMethod.get,
    );
  }

  RequestOptions mfaLogs() {
    return RequestOptions(
      path: '/okta/mfalogs/$routeParams',
      method: APIMethod.get,
    );
  }

  RequestOptions factors() {
    return RequestOptions(
      path: '/okta/users/$routeParams/factors',
      method: APIMethod.get,
    );
  }

  RequestOptions loginAuth() {
    return RequestOptions(
      path: '/okta/authenticate',
      method: APIMethod.post,
      headers: headerQueryParams != null
          ? {'x-device-token': '$headerQueryParams'}
          : {'x-device-token': ''},
    );
  }

  RequestOptions sendCodeForMFASetup() {
    return RequestOptions(
      path: '/users/factors',
      method: APIMethod.post,
    );
  }

  RequestOptions activateMFASetup() {
    return RequestOptions(
      path: '/users/factors/lifecycle/activate',
      method: APIMethod.post,
    );
  }

  RequestOptions createNewPassword() {
    return RequestOptions(
      path: '/okta/users/credentials/change_password',
      method: APIMethod.post,
    );
  }

  RequestOptions setupSecurityQuestion() {
    return RequestOptions(
      path: '/users/user/security_question',
      method: APIMethod.put,
    );
  }

  RequestOptions acceptTermsOfService() {
    return RequestOptions(
      path: '/ua/insert',
      method: APIMethod.post,
      headers: headerQueryParamsMap ?? {'Authorization': ''},
    );
  }

  RequestOptions checkTermsOfServiceStatus() {
    return RequestOptions(
      path: '/ua/retrieve',
      method: APIMethod.post,
      headers: headerQueryParamsMap ?? {'Authorization': ''},
    );
  }

  RequestOptions getRewardsUrl() {
    return RequestOptions(
      path: '/saml/sso',
      method: APIMethod.post,
    );
  }

  RequestOptions siteLocatorAccessToken() {
    return RequestOptions(
      path: '/app/token',
      method: APIMethod.post,
    );
  }

  RequestOptions siteLocations() {
    return RequestOptions(
      path: Globals().isComdata
          ? cardholderSiteLocationsPath
          : adminSiteLocationsPath,
      method: APIMethod.post,
      headers: headerQueryParams != null
          ? {'Authorization': 'Bearer $headerQueryParams'}
          : {'Authorization': ''},
    );
  }

  RequestOptions siteLocationsDistanceMatrix(String? directUrl) {
    return RequestOptions(
      path: '$directUrl',
      method: APIMethod.get,
      extra: {'directUrl': true},
      headers: apiKeySecurityHeaders,
    );
  }

  RequestOptions siteLocationsPlacesAutoComplete(String? directUrl) {
    return RequestOptions(
      path: '$directUrl',
      method: APIMethod.get,
      extra: {'directUrl': true},
      headers: apiKeySecurityHeaders,
    );
  }

  RequestOptions siteLocationsGeoCoding(String? directUrl) {
    return RequestOptions(
      path: '$directUrl',
      method: APIMethod.get,
      extra: {'directUrl': true},
      headers: apiKeySecurityHeaders,
    );
  }

  RequestOptions sitesBrandLogoUrls() {
    return RequestOptions(
      path: '/SLS/brand-logos',
      method: APIMethod.get,
      headers: headerQueryParams != null
          ? {'Authorization': 'Bearer $headerQueryParams'}
          : {'Authorization': ''},
    );
  }

  RequestOptions oktaAuthn() {
    return RequestOptions(
      path: '/api/v2/authn',
      method: APIMethod.post,
    );
  }

  RequestOptions oktaAuthorize() {
    return RequestOptions(
      path: '/api/v2/authorize',
      method: APIMethod.get,
    );
  }

  RequestOptions oktaToken() {
    return RequestOptions(
        path: '/api/v2/token',
        method: APIMethod.post,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
  }

  RequestOptions oktaGetUserDetails() {
    return RequestOptions(
      path: '/api/v2/idp-user/users/$routeParams',
      method: APIMethod.get,
    );
  }

  RequestOptions oktaSearchUser() {
    return RequestOptions(
      path: '/api/v2/idp-user/users?search=$routeParams',
      method: APIMethod.get,
    );
  }

  RequestOptions oktaResetPassword() {
    return RequestOptions(
      path: '/api/v2/idp-user/users/$routeParams/reset-password?sendEmail=true',
      method: APIMethod.post,
    );
  }

  RequestOptions oktaRevokeToken() {
    return RequestOptions(
        path: '/api/v2/revoke-token',
        method: APIMethod.post,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'});
  }

  RequestOptions oktaCreateUser() {
    return RequestOptions(
      path: '/api/v2/idp-user/user?$routeParams',
      method: APIMethod.post,
    );
  }

  RequestOptions oktaChangePassword() {
    return RequestOptions(
        path: '/api/v2/idp-user/user/change-password',
        method: APIMethod.post,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-jwt': '$routeParams'
        });
  }

  RequestOptions post() {
    return RequestOptions(
      path: '/post',
      method: APIMethod.post,
    );
  }

  RequestOptions get() {
    return RequestOptions(
      path: '/get',
      method: APIMethod.get,
    );
  }

  RequestOptions put() {
    return RequestOptions(
      path: '/put',
      method: APIMethod.put,
    );
  }

  RequestOptions patch() {
    return RequestOptions(
      path: '/patch',
      method: APIMethod.patch,
    );
  }

  RequestOptions delete() {
    return RequestOptions(
      path: '/delete',
      method: APIMethod.delete,
    );
  }

  @override
  APIType getApiType() {
    return type;
  }
}

// ignore: one_member_abstracts
abstract class APIRouteConfigurable {
  RequestOptions? getConfig();
  APIType getApiType();
}

class APIMethod {
  static const get = 'GET';
  static const post = 'POST';
  static const put = 'PUT';
  static const patch = 'PATCH';
  static const delete = 'DELETE';
}
