enum AnalyticsSiteSection {
  welcome('welcome'),
  forgotUserName('forgot user name'),
  forgotPassword('forgot password'),
  login('login'),
  signup('signup'),
  home('home'),
  transfer('transfer'),
  activity('activity'),
  bottomNavigation('bottom navigation'),
  myAccounts('my accounts'),
  cards('cards'),
  settings('settings'),
  cipCheck('cip check'),
  logout('logout'),
  siteLocator('site locator'),
  mapview('map view'),
  registration('registration'),
  sendMfaVerificationCode('send MFA verification code'),
  verifyMfaVerificationCode('verify MFA verification code'),
  resetPassword('reset password'),
  dashboard('dashboard'),
  mapViewMenuDrawer('map view menu drawer'),
  noLocationModel('no location model'),
  siteInfoDrawer('site info drawer'),
  enhancedFilter('enhancedFilter'),
  noTracking('no tracking'),
  surveyDrawer('survey drawer'),
  preferredHomeScreenModal('preferred home screen modal');

  const AnalyticsSiteSection(this.value);

  final String value;
}

enum AnalyticsScreenName {
  noTracking('no tracking', AnalyticsSiteSection.noTracking),
  welcome('welcome', AnalyticsSiteSection.welcome),
  forgotUserName('forgot user name', AnalyticsSiteSection.forgotUserName),
  forgotPassword('forgot password', AnalyticsSiteSection.forgotPassword),
  forceUpdate('force update pop up', AnalyticsSiteSection.welcome),
  login('login', AnalyticsSiteSection.login),
  home('home', AnalyticsSiteSection.home),
  wallet('wallet', AnalyticsSiteSection.cards),
  manageCards('manage cards', AnalyticsSiteSection.cards),
  cardsList('cards list', AnalyticsSiteSection.cards),
  cardOrder('card order', AnalyticsSiteSection.cards),
  activity('activity', AnalyticsSiteSection.activity),
  activityDetails('activity : details', AnalyticsSiteSection.activity),
  transferFunds('transfer funds', AnalyticsSiteSection.transfer),
  p2pTransfer('transfer : p2p', AnalyticsSiteSection.transfer),
  bankTransfer('transfer : bank', AnalyticsSiteSection.transfer),
  createComcheck('transfer: create comcheck', AnalyticsSiteSection.transfer),
  expressCode('transfer : express code', AnalyticsSiteSection.transfer),
  expressCodeBalance(
      'transfer : express code balance', AnalyticsSiteSection.transfer),
  transactionFilter('activity : filter', AnalyticsSiteSection.activity),
  transaction('transaction', AnalyticsSiteSection.activity),
  addNewCard('card : add new card', AnalyticsSiteSection.cards),
  applyCard('card : apply for card', AnalyticsSiteSection.cards),
  employmentInfo(
      'card : payroll info : add new card', AnalyticsSiteSection.cards),
  cardSettings('card : card settings', AnalyticsSiteSection.cards),
  setNewPin('card : set new pin', AnalyticsSiteSection.cards),
  setPrimary('card : change to primary', AnalyticsSiteSection.cards),
  setFavourite('card : change to Favourite', AnalyticsSiteSection.cards),
  changeNickname('card : change nick name', AnalyticsSiteSection.cards),
  removeCard('card : remove card', AnalyticsSiteSection.cards),
  mySettings('my settings', AnalyticsSiteSection.myAccounts),
  updateEmailAddress('update email address', AnalyticsSiteSection.myAccounts),
  reportProblem('report problem', AnalyticsSiteSection.myAccounts),
  notification('notification', AnalyticsSiteSection.myAccounts),
  legalPrivacy('legal & privacy', AnalyticsSiteSection.myAccounts),
  helpCenter('help center', AnalyticsSiteSection.myAccounts),
  bankAccounts('bank accounts', AnalyticsSiteSection.myAccounts),
  bankAccountReview('bank account review', AnalyticsSiteSection.myAccounts),
  resetPassword('reset password', AnalyticsSiteSection.myAccounts),
  accountPage('account page', AnalyticsSiteSection.myAccounts),
  changePassword('account page', AnalyticsSiteSection.myAccounts),
  accountSettings('account settings', AnalyticsSiteSection.myAccounts),
  deleteAccount('delete account', AnalyticsSiteSection.myAccounts),
  logout('logout', AnalyticsSiteSection.myAccounts),
  cipCheck('cip check', AnalyticsSiteSection.cipCheck),
  activityNavigation(
    'activity navigation',
    AnalyticsSiteSection.bottomNavigation,
  ),
  transferNavigation(
    'transfer navigation',
    AnalyticsSiteSection.bottomNavigation,
  ),
  walletNavigation('wallet navigation', AnalyticsSiteSection.bottomNavigation),
  signup('sign-up', AnalyticsSiteSection.signup),
  incompleteSignup('incomplete-sign-up', AnalyticsSiteSection.signup),
  userRegistration('user registration', AnalyticsSiteSection.signup),
  cardInformation('card information', AnalyticsSiteSection.signup),
  cardVerificationSuccess('card verified success', AnalyticsSiteSection.signup),
  onRoadSignupBasicInfoPage(
      'onroad : signup basic info', AnalyticsSiteSection.signup),
  onRoadSignupBusinessInfoPage(
      'onroad : signup business info', AnalyticsSiteSection.signup),
  onRoadSignupIndividualReview(
      'onroad : signup individual review', AnalyticsSiteSection.signup),
  onRoadSignupBusinessReview(
      'onroad : signup business review', AnalyticsSiteSection.signup),
  comchekSignupSelectUserTypePage(
      'comchek : select user', AnalyticsSiteSection.signup),
  comchekCreateAccountSuccessPage(
      'comchek : create account success page', AnalyticsSiteSection.signup),
  onRoadCreateAccountSuccessPage(
      'onroad : create account success page', AnalyticsSiteSection.signup),

  // Fuelman
  welcomeWithMap('welcome with Map', AnalyticsSiteSection.welcome),
  adminWelcome('welcome with Map', AnalyticsSiteSection.welcome),
  registration('registration', AnalyticsSiteSection.registration),
  sendMfaVerificationCode('send MFA verification code',
      AnalyticsSiteSection.sendMfaVerificationCode),
  verifyMfaVerificationCode('verify MFA verification code',
      AnalyticsSiteSection.verifyMfaVerificationCode),
  adminResetPassword('reset password', AnalyticsSiteSection.resetPassword),
  passwordResetSuccess(
      'password reset success', AnalyticsSiteSection.resetPassword),
  dashboard('dashboard', AnalyticsSiteSection.dashboard),
  dashboardPageLoadError(
      'page load error modal', AnalyticsSiteSection.dashboard),
  adminHomeNavigation('home navigation', AnalyticsSiteSection.bottomNavigation),
  payNavigation('pay navigation', AnalyticsSiteSection.bottomNavigation),
  cardsNavigation('cards navigation', AnalyticsSiteSection.bottomNavigation),
  locatorNavigation(
      'locator navigation', AnalyticsSiteSection.bottomNavigation),
  settingsNavigation(
      'settings navigation', AnalyticsSiteSection.bottomNavigation),

  // Site Locator: Mapview
  welcomeScreen('welcome with Map View', AnalyticsSiteSection.siteLocator),
  mapClick('map view screen : map click', AnalyticsSiteSection.siteLocator),
  mapview('map view screen : map click', AnalyticsSiteSection.mapview),
  fuelQuickFilter('map view screen : fuel quick filter click',
      AnalyticsSiteSection.mapview),
  serviceQuickFilter('map view screen : service quick filter click',
      AnalyticsSiteSection.mapview),
  discountsQuickFilter('map view screen : discounts quick filter click',
      AnalyticsSiteSection.mapview),
  favouritesQuickFilter('map view screen : favourites quick filter click',
      AnalyticsSiteSection.mapview),
  mapZoomIn('map view screen : zoom in', AnalyticsSiteSection.mapview),
  mapZoomOut('map view screen : zoom out', AnalyticsSiteSection.mapview),
  mapReposition('map view screen : reposition', AnalyticsSiteSection.mapview),

  // Site Locator: Filters
  filterButton('map view screen : filters button click',
      AnalyticsSiteSection.siteLocator),

  // Site Locator: Location api
  locationApiSuccess(
      'api : location summary : success', AnalyticsSiteSection.siteLocator),
  locationApiFailure(
      'api : location summary : failure', AnalyticsSiteSection.siteLocator),

  // Site locator: No location modal
  noLocationModalScreen(
      'no location modal', AnalyticsSiteSection.noLocationModel),

  // Site locator: Site Info Drawer
  siteInfoDrawer(
      'site info drawer : screen visit', AnalyticsSiteSection.siteInfoDrawer),

  // Site locator: List View Screen
  siteLocationsListviewScreen('list view', AnalyticsSiteSection.mapview),

  // Sitelocator
  mapviewScreen('map view', AnalyticsSiteSection.siteLocator),

  // Site locator: Menu Drawer
  mapviewMenuDrawer(
      'map view menu drawer', AnalyticsSiteSection.mapViewMenuDrawer),
  mapViewHelpCenter(
      'menu drawer : help center', AnalyticsSiteSection.mapViewMenuDrawer),
  mapViewLegalPrivacy(
      'menu drawer : legal privacy', AnalyticsSiteSection.mapViewMenuDrawer),
  preferencesFilters('menu drawer : preferences filters',
      AnalyticsSiteSection.mapViewMenuDrawer),
  mapViewLogin('menu drawer : login', AnalyticsSiteSection.mapViewMenuDrawer),

  // Site locator: Enhanced Filters Screen
  enhancedFiltersScreen(
      'enhanced filters', AnalyticsSiteSection.enhancedFilter),

  // Survey Drawer : Survey drawer
  surveyDrawer(
      'survey drawer : survey drawer open', AnalyticsSiteSection.surveyDrawer),

  // Preferred Home screen modal
  preferredHomeScreenModal('preferred home screen modal',
      AnalyticsSiteSection.preferredHomeScreenModal);

  const AnalyticsScreenName(this._value, this.section);

  final String _value;
  final AnalyticsSiteSection section;

  String get value => _value;
}

enum AnalyticsPlatform {
  mobileApp('mobile application'),
  webpage('webpage');

  const AnalyticsPlatform(this.value);

  final String value;
}

enum AnalyticsLineOfBusiness {
  // Need to refactor with AppUtils.Flavor
  comdata('comdata'),
  fuelman('fuelman');

  const AnalyticsLineOfBusiness(this.value);

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
