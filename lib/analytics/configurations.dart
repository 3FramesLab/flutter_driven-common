enum AnalyticsPlatform {
  mobileApp('mobile application'),
  webpage('webpage');

  const AnalyticsPlatform(this.value);

  final String value;
}

enum AnalyticsAuthState {
  preLogin('pre login'),
  postLogin('post login');

  const AnalyticsAuthState(this.value);

  final String value;
}

enum AnalyticsActionType {
  buttonClick('button click'),
  radioButtonChange('radio button changes'),
  switchChange('switch changes'),
  checkboxChange('checkbox changes'),
  webLink('web link'),
  textClick('text click'),
  iconClick('icon click');

  const AnalyticsActionType(this.value);

  final String value;
}
