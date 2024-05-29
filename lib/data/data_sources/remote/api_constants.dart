class ApiConstants {
  ApiConstants._internal();
  static final ApiConstants _instance = ApiConstants._internal();
  static ApiConstants get instance => _instance;

  String baseUrl = '';
}
