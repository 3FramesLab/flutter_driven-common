class AnalyticsTrackActionName {
  //Common
  static const backButton = 'back button';
  static const error = 'error';
  static const cancel = 'cancel';

  //Welcome Screen
  static const welcomeFirstTimeLoginMessage = 'first time login message';
  static const legalButton = 'legal/privacy button';
  static const authLoginStatus = 'auth/user login status';
  static const biometricLogin = 'triggered biometric login';
  static const faceIdIconDetected = 'biometric faceid icon detected';
  static const fingerprintIconDetected = 'biometric fingerprint icon detected';
  static const biometricLoginSuccess = 'biometric login success';
  static const biometricLoginFailed = 'biometric login failed';
  static const mapClick = 'welcome : map';
  static const loginAsCardholderClick = 'welcome : login as cardholder';
  static const loginAsAdminClick = 'welcome : login as admin';

  //Force Update pop up
  static const updateNeeded = 'update needed';
  static const updateNotNeeded = 'app is up to date';
  static const exceptionForceUpdate = 'exception, show update popup';

  //Signup
  static const createAccount = 'signup : create account button click';
  static const createAccountIncomplete =
      'incomplete signup : create account button click';
  static const signupBusiness = 'business signup button click';
  static const signupIndividual = 'individual signup button click';
  static const alreadyHaveAccountSignUp =
      'signup : already have an account login button click';
  static const alreadyHaveAccountIncompleteSignUp =
      'incomplete signup : already have an account login button click';
  static const alreadyHaveAccountSelectSignupType =
      'select signup type : already have an account login button click';
  static const incompleteSignupIndividual =
      'incomplete signup : individual button click';
  static const incompleteSingupBusiness = 'incomplete signup : business click';
  static const incompleteSignupSuccess = 'api : incomplete signup : Success';
  static const incompleteSignupFailure = 'api : incomplete signup : Failure';
  static const signupSuccess = 'api : signup : Success';
  static const signupFailure = 'api : signup : Failure';

  //Get Username
  static const getUserNameApiSuccess = 'api : get user name : Success';
  static const getUserNameApiFailure = 'api : get user name : Failure';

  //Forgot Username
  static const sendEmail = 'need a card button';
  static const forgotUserNameApiSuccess = 'api : forgot user name : Success';
  static const forgotUserNameApiFailure = 'api : forgot user name : Failure';
  static const forgotUsername = 'Forgot Username';
  static const forgotPassword = 'Forgot Password';

  //Settings
  static const emailReceiptsTurnOn = 'email receipts : on';
  static const emailReceiptsTurnOff = 'email receipts : off';
  static const expressCodeConfirmationTurnOn = 'express code confirmation : on';
  static const expressCodeConfirmationTurnOff =
      'express code confirmation : off';
  static const biometricsTurnOn = 'biometrics : on';
  static const biometricsTurnOff = 'biometrics : off';
  static const saveUserNameTurnOn = 'save user name : on';
  static const saveUserNameTurnOff = 'save user name : off';
  // Preferred Home Screen Toggle
  static const locatorMapAsHomeTurnOn = 'save locator map as home screen : on';
  static const locatorMapAsHomeTurnOff =
      'save locator map as home screen : off';

  //Avatar
  static const avatar = 'circle avatar icon';

  //ChangePassword
  static const changePasswordSuccessEvent = 'change password : success';
  static const changePasswordFailureEvent = 'change password : failure';

  //Update email address
  static const updateEmailAddressSuccessEvent = 'update emailAddress : success';
  static const updateEmailAddressFailureEvent = 'update emailAddress : failure';

  //Bank Account
  static const fetchCurrentAccountSuccessEvent =
      'fetch current bank account : success';
  static const fetchCurrentAccountFailureEvent =
      'fetch current bank account : failure';

  // Site Locator: Mapview
  static const executeSearchEvent = 'map view screen : Execute Search';
  static const recenterButtonClickedEvent =
      'map view screen : recenter button click';
  static const locationPinClickedEvent = 'map view screen : location pin click';
  static const mapZoomInEvent = 'map view screen : zoom in';
  static const mapZoomOutEvent = 'map view screen : zoom out';
  static const repositionEvent = 'map view screen : reposition';
  static const cardholderNavSiteLocator = 'cardholder nav : site locator';
  static const walletSiteLocatorClick = 'wallet : site locator map';

  // Site Locator: Filters
  static const filtersButtonClickedEvent =
      'map view screen : filters button click';
  static const listviewButtonsClickedEvent =
      'map view screen : listview button click';

  // Site Locator: Location api
  static const locationSummaryApiSuccessEvent =
      'api : location summary : success';
  static const locationSummaryApiFailEvent = 'api : location summary : failure';

  // Site locator: No location modal
  static const noLocationModalExpandSearchEvent =
      'no location modal : expand search by 5 miles button click';
  static const noLocationModalClearNewFilterLinkClickEvent =
      'no location modal : clear new filter link click';
  static const noLocationModalCancelLinkClickEvent =
      'no location modal : cancel link click';

  // Site locator: Site Info Drawer
  static const siteInfoDrawerFeesMayApplyLinkClickEvent =
      'site info drawer : fees may apply link click';
  static const siteInfoDrawerViewAllDiscountsLinkClickEvent =
      'site info drawer : view all discounts link click';
  static const siteInfoDrawerAddToFavoritesLinkClickEvent =
      'site info drawer : add to favorites link click';
  static const siteInfoDrawerRemoveFromFavoritesLinkClickEvent =
      'site info drawer : remove from favorites link click';
  static const siteInfoDrawerDirectionsButtonLinkClickEvent =
      'site info drawer : directions button link click';
  static const siteInfoDrawerCallButtonLinkClickEvent =
      'site info drawer : call button link click';
  static const siteInfoDrawerSlideToFullScreenEvent =
      'site info drawer : slide to full screen click';

  // Site locator: List View Screen
  static const listViewScreenExecuteSearchEvent =
      'list view screen : list view screen execute search';
  static const listViewFiltersButtonClickEvent =
      'list view screen : filters button click';
  static const listViewViewMoreSitesLinkClickEvent =
      'list view screen : view more sites link click';
  static const listViewDirectionsLinkClickEvent =
      'list view screen : directions link click';
  static const listViewDetailsLinkClickEvent =
      'list view screen : details link click';
  static const listViewAddToFavoritesLinkClickEvent =
      'list view screen : add to favorites link click';
  static const listViewRemoveFromFavoritesLinkClickEvent =
      'list view screen : remove from favorites link click';

  // Site locator: Enhanced Filters Screen
  static const enhancedFiltersApplyFiltersButtonClickEvent =
      'enhanced filters screen : apply filters button click';
  static const enhancedFiltersClearFiltersLinkClickEvent =
      'enhanced filters screen : clear filters link click';
  static const enhancedFiltersBackLinkClickEvent =
      'enhanced filters screen : back link click';

  // Site locator: Menu Drawer
  static const menuDrawerVisitEvent = 'menu drawer : menu drawer visit';
  static const menuDrawerLoginLinkClickEvent = 'menu drawer : login link click';
  static const menuDrawerLogoutLinkClickEvent =
      'menu drawer : logout link click';
  static const menuDrawerPreferencesFiltersLinkClickEvent =
      'menu drawer : preferences & filters link click';
  static const menuDrawerHelpCenterLinkClickEvent =
      'menu drawer : help center link click';
  static const menuDrawerLegalPrivacyLinkClickEvent =
      'menu drawer : legal/privacy link click';

  static const fleetManagerLoginClick = 'Fleet Manager Login click';

  // Login
  static const loginClick = 'login : login button';
  static const loginForgotPasswordClick = 'login : forgot password';
  static const loginRegisterNowClick = 'login : fleet manager register now';
  static const loginFaceIdClick = 'login : face id';
  static const loginTouchIdClick = 'login : touch id';
  static const backToLoginClick = 'login : back to login';
  static const loginForgotUserName = 'login : forgot username';
  static const switchToCardHolder = 'login : switch to cardholder';
  static const switchToFleetManager = 'login : switch to fleet manager';
  static const cardHolderSignUp = 'login : cardholder signup';

  // Forgot Password
  static const forgotPasswordContinueClick = 'forgot password : continue';

  // Send MFA Verification Code
  static const smsCodeRadioButtonSelected =
      'send code : sms code radio button selected';
  static const emailCodeRadioButtonSelected =
      'send code : email code radio button selected';
  static const sendMfaCodeClick = 'send code : send mfa code';

  // Verify MFA Verification Code
  static const verifyMfaCodeClick = 'verify code : verify code';
  static const resendMfaCodeClick = 'verify code : resend code';
  static const sendToEmailClick = 'verify code : send to email';
  static const sendToPhoneClick = 'verify code : send to phone';

  // Reset Password
  static const resetPasswordConfirmClick = 'reset password : confirm';
  static const forgotSecurityQuestionClick =
      'reset password : forgot security question';

  // Dashboard
  static const homeIconClick = 'dashboard : home icon navigation';
  static const payIconClick = 'dashboard : pay icon navigation';
  static const activityIconClick = 'dashboard : activity icon navigation';
  static const cardsIconClick = 'dashboard : cards icon navigation';
  static const locatorIconClick = 'dashboard : locator icon navigation';
  static const settingsIconClick = 'dashboard : settings icon navigation';
  static const launchBillTrustUrl = 'dashboard : launch bill trust URL';
  static const launchFleetDashUrl = 'dashboard : launch fleet dash URL';
  static const launchFuelmanMaintenanceUrl =
      'dashboard : launch fuel maintenance URL';
  static const launchReportsUrl = 'dashboard : launch reports URL';

  // OKTA Login
  static const oktaCall = 'OKTA API Call';
  static const loginSuccess = 'login : Success';
  static const loginFailure = 'login : Failure';
  static const notDrivenUser = 'not driven user';
  static const passwordExpired = 'password expired';
  static const deletedUserCredentialsSuccess =
      'deleted username and password : Success';
  static const deletedUserCredentialsFailure =
      'deleted username and password : Failure';

  // Account menu
  static const changePasswordMenuEvent =
      'my account menu: change password click';
  static const updateEmailMenuEvent =
      'my account menu: update email address click';
  static const changeBankAccountMenuEvent =
      'my account menu: change bank account click';
  static const settingsMenuEvent = 'my account menu: settings click';
  static const applyForCardMenuEvent = 'my account menu: apply for card click';
  static const reportAProblemMenuEvent =
      'my account menu: report a problem click';
  static const notificationsMenuEvent = 'my account menu: notifications click';
  static const helpCenterMenuEvent = 'my account menu: help center click';
  static const legalPrivacyMenuEvent = 'my account menu: legal privacy click';
  static const deleteAccountMenuEvent = 'my account menu: delete account click';

  // Survey Drawer
  static const doItLaterButtonEvent = "survey drawer : I'll do it later button";
  static const takeSurveyButtonEvent = 'survey drawer : take survey button';
  static const noThanksButtonEvent = 'survey drawer : no thanks button';
  static const surveyDrawerVisitEvent = 'survey drawer : survey slider open';

  // Preferred Home Screen Modal
  static const preferredHomeScreenYesButtonEvent =
      'preferred home screen modal : yes';
  static const preferredHomeScreenNoButtonEvent =
      'preferred home screen modal : no thanks';

  //Change card
  static const mapViewChangeCardEvent = 'map view : change card';
  static const changeCardEvent = 'Change Card';
}
