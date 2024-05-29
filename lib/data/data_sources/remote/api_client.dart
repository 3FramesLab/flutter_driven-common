part of data_module;

class APIClient {
  late BaseOptions options;
  late Dio instance;

  APIClient({BaseOptions? options}) {
    this.options = options ?? _defaultBaseOptions;
    instance = Dio(options);
  }

  BaseOptions get _defaultBaseOptions => BaseOptions(
        baseUrl: ApiConstants.instance.baseUrl,
      );

  // ignore: long-parameter-list
  Future<ResponseWrapper<T>> request<T extends Decodable<dynamic>>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
    // AnalyticsScreenName? analyticsScreenName = AnalyticsScreenName.noTracking,
    String? analyticsScreenName = 'no tracking',
    bool isDeviceTokenFromHeaderRequired = false,
  }) async {
    final config = route.getConfig();
    if (config == null) {
      throw ErrorResponse(errorSummary: DrivenConstants.requestFailed);
    }
    config.baseUrl = options.baseUrl;
    if (data != null) {
      config.method == APIMethod.get
          ? config.queryParameters = data
          : config.data = data;
    }
    try {
      final response = await _httpCall(config);
      if (isDeviceTokenFromHeaderRequired && isDeviceTokenAvailable(response)) {
        response.data[DrivenConstants.xDeviceToken] =
            response.headers.map[DrivenConstants.xDeviceTokenHeader]?.first;
      }
      return ResponseWrapper.init(create: create, data: response.data);
    } on DioError catch (error) {
      Globals().dynatrace.logError(
            name: 'API Call Error - ${config.uri}',
            value: error.message,
            reason: error.toString(),
          );
      var errorResponse =
          ErrorResponse(errorSummary: DrivenConstants.somethingWentWrong);
      errorResponse.headers = error.response?.headers;
      errorResponse.statusCode = error.response?.statusCode;
      try {
        errorResponse = ErrorResponse.fromJson(error.response?.data);
      } catch (error) {
        Globals().dynatrace.logError(
              name: 'API Call Parsing Error - ${config.uri}',
              value: error.toString(),
              reason: error.toString(),
            );
        throw errorResponse;
      }
      throw errorResponse;
    }
  }

  Future<Response<T>> _httpCall<T>(RequestOptions requestOptions) async {
    final url = '${requestOptions.baseUrl}${requestOptions.path}';
    switch (requestOptions.method) {
      case APIMethod.post:
        return instance.post(
          url,
          data: requestOptions.data,
          options: Options(headers: requestOptions.headers),
        );
      case APIMethod.put:
        return instance.put(
          url,
          data: requestOptions.data,
        );
      case APIMethod.patch:
        return instance.patch(
          url,
          data: requestOptions.data,
        );
      case APIMethod.delete:
        return instance.delete(
          url,
          data: requestOptions.data,
        );
      case APIMethod.get:
        if (requestOptions.extra['directUrl'] ?? false) {
          return instance.get(
            requestOptions.path,
            options: Options(headers: requestOptions.headers),
          );
        } else {
          if (requestOptions.headers.entries.isNotEmpty) {
            return instance.get(
              url,
              queryParameters: requestOptions.queryParameters,
              options: Options(headers: requestOptions.headers),
            );
          } else {
            return instance.get(
              url,
              queryParameters: requestOptions.queryParameters,
            );
          }
        }

      default:
        return Response(requestOptions: RequestOptions(path: ''));
    }
  }

  bool isDeviceTokenAvailable(Response<dynamic> response) =>
      response.headers.map
          .toString()
          .containsIgnoreCase(DrivenConstants.xDeviceTokenHeader);

  // AnalyticsScreenName fetchScreenType(String path) {
  //   if (path == DrivenConstants.oktaRevokeTokenCall) {
  //     return AnalyticsScreenName.accountPage;
  //   } else if (path.contains(DrivenConstants.oktaProfileCall)) {
  //     return AnalyticsScreenName.accountPage;
  //   } else if (path == DrivenConstants.oktaAuthnCall ||
  //       path == DrivenConstants.oktaAuthorizeCall ||
  //       path == DrivenConstants.oktaTokenCall) {
  //     return AnalyticsScreenName.login;
  //   } else {
  //     return AnalyticsScreenName.accountPage;
  //   }
  // }
}
