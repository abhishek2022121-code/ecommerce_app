import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('mr'),
    Locale('pa'),
    Locale('ta'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'QUICK FASHION'**
  String get appTitle;

  /// No description provided for @btnSkip.
  ///
  /// In en, this message translates to:
  /// **'SKIP'**
  String get btnSkip;

  /// No description provided for @btnConfirmSelection.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM SELECTION'**
  String get btnConfirmSelection;

  /// No description provided for @btnSignIn.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get btnSignIn;

  /// No description provided for @splashTheVelocity.
  ///
  /// In en, this message translates to:
  /// **'THE VELOCITY'**
  String get splashTheVelocity;

  /// No description provided for @splashOfStyle.
  ///
  /// In en, this message translates to:
  /// **'OF STYLE'**
  String get splashOfStyle;

  /// No description provided for @velocitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'High-speed curation for the modern vanguard. Experience the digital pulse of fashion.'**
  String get velocitySubtitle;

  /// No description provided for @btnEnterRunway.
  ///
  /// In en, this message translates to:
  /// **'ENTER THE RUNWAY'**
  String get btnEnterRunway;

  /// No description provided for @labelMemberExclusive.
  ///
  /// In en, this message translates to:
  /// **'MEMBER EXCLUSIVE'**
  String get labelMemberExclusive;

  /// No description provided for @btnJoinClub.
  ///
  /// In en, this message translates to:
  /// **'JOIN THE CLUB'**
  String get btnJoinClub;

  /// No description provided for @labelSustainable.
  ///
  /// In en, this message translates to:
  /// **'CERTIFIED SUSTAINABLE PARTNERS'**
  String get labelSustainable;

  /// No description provided for @ageTitleStart.
  ///
  /// In en, this message translates to:
  /// **'Tailor your '**
  String get ageTitleStart;

  /// No description provided for @ageTitleEnd.
  ///
  /// In en, this message translates to:
  /// **'Pulse.'**
  String get ageTitleEnd;

  /// No description provided for @ageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Our editorial engine curates trends based on your generation\'s velocity. Select your bracket.'**
  String get ageSubtitle;

  /// No description provided for @ageLabelGenZ.
  ///
  /// In en, this message translates to:
  /// **'GEN Z\nNEXT'**
  String get ageLabelGenZ;

  /// No description provided for @ageLabelKinetic.
  ///
  /// In en, this message translates to:
  /// **'PEAK\nKINETIC'**
  String get ageLabelKinetic;

  /// No description provided for @ageLabelMillennial.
  ///
  /// In en, this message translates to:
  /// **'EDITORIAL\nMILLENNIAL'**
  String get ageLabelMillennial;

  /// No description provided for @ageLabelTimeless.
  ///
  /// In en, this message translates to:
  /// **'TIMELESS\nAUTHORITY'**
  String get ageLabelTimeless;

  /// No description provided for @labelVerifiedChoice.
  ///
  /// In en, this message translates to:
  /// **'VERIFIED CHOICE'**
  String get labelVerifiedChoice;

  /// No description provided for @descVerifiedChoice.
  ///
  /// In en, this message translates to:
  /// **'Over 2.4M fashionistas use these demographics to fuel their personal feed daily.'**
  String get descVerifiedChoice;

  /// No description provided for @genderStep.
  ///
  /// In en, this message translates to:
  /// **'STEP 01'**
  String get genderStep;

  /// No description provided for @genderHeading.
  ///
  /// In en, this message translates to:
  /// **'WHO ARE WE\nSTYLING?'**
  String get genderHeading;

  /// No description provided for @genderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your preference to curate a high-velocity fashion feed tailored to your aesthetic pulse.'**
  String get genderSubtitle;

  /// No description provided for @labelCuration.
  ///
  /// In en, this message translates to:
  /// **'CURATION'**
  String get labelCuration;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'FEMALE'**
  String get genderFemale;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'MALE'**
  String get genderMale;

  /// No description provided for @genderChangeNote.
  ///
  /// In en, this message translates to:
  /// **'YOU CAN CHANGE THIS ANYTIME IN SETTINGS'**
  String get genderChangeNote;

  /// No description provided for @langSelection.
  ///
  /// In en, this message translates to:
  /// **'SELECTION'**
  String get langSelection;

  /// No description provided for @langChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your'**
  String get langChooseTitle;

  /// No description provided for @langDialect.
  ///
  /// In en, this message translates to:
  /// **'Dialect.'**
  String get langDialect;

  /// No description provided for @langSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Experience fashion in the language that resonates with your personal style.'**
  String get langSubtitle;

  /// No description provided for @langEnglishTitle.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglishTitle;

  /// No description provided for @langEnglishSub.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL STANDARD'**
  String get langEnglishSub;

  /// No description provided for @langHindiTitle.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get langHindiTitle;

  /// No description provided for @langHindiSub.
  ///
  /// In en, this message translates to:
  /// **'HINDI'**
  String get langHindiSub;

  /// No description provided for @langVelocityStyle.
  ///
  /// In en, this message translates to:
  /// **'VELOCITY &\nSTYLE'**
  String get langVelocityStyle;

  /// No description provided for @langFooter.
  ///
  /// In en, this message translates to:
  /// **'QUICK FASHION © 2024 • EDITORIAL LANGUAGE INTERFACE V2.0'**
  String get langFooter;

  /// No description provided for @styleCurateLabel.
  ///
  /// In en, this message translates to:
  /// **'CURATE YOUR FEED'**
  String get styleCurateLabel;

  /// No description provided for @styleTailorTitle.
  ///
  /// In en, this message translates to:
  /// **'TAILOR YOUR'**
  String get styleTailorTitle;

  /// No description provided for @stylePulseTitle.
  ///
  /// In en, this message translates to:
  /// **'FASHION PULSE'**
  String get stylePulseTitle;

  /// No description provided for @styleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select at least three categories to build your personalized editorial stream. High-speed fashion starts here.'**
  String get styleSubtitle;

  /// No description provided for @styleStreetwear.
  ///
  /// In en, this message translates to:
  /// **'Streetwear'**
  String get styleStreetwear;

  /// No description provided for @styleLuxury.
  ///
  /// In en, this message translates to:
  /// **'Luxury'**
  String get styleLuxury;

  /// No description provided for @styleEthical.
  ///
  /// In en, this message translates to:
  /// **'Ethical Fashion'**
  String get styleEthical;

  /// No description provided for @styleAccessories.
  ///
  /// In en, this message translates to:
  /// **'Accessories'**
  String get styleAccessories;

  /// No description provided for @styleAvantGarde.
  ///
  /// In en, this message translates to:
  /// **'Avant-Garde'**
  String get styleAvantGarde;

  /// No description provided for @styleFootwear.
  ///
  /// In en, this message translates to:
  /// **'Footwear'**
  String get styleFootwear;

  /// No description provided for @styleVintage.
  ///
  /// In en, this message translates to:
  /// **'Vintage'**
  String get styleVintage;

  /// No description provided for @styleMinimalist.
  ///
  /// In en, this message translates to:
  /// **'Minimalist'**
  String get styleMinimalist;

  /// No description provided for @styleActivewear.
  ///
  /// In en, this message translates to:
  /// **'Activewear'**
  String get styleActivewear;

  /// No description provided for @styleRunway.
  ///
  /// In en, this message translates to:
  /// **'Runway'**
  String get styleRunway;

  /// No description provided for @btnLaunchPulse.
  ///
  /// In en, this message translates to:
  /// **'Launch My Pulse'**
  String get btnLaunchPulse;

  /// No description provided for @loginHeading.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get loginHeading;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Access your curated style dashboard.'**
  String get loginSubtitle;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'EMAIL ADDRESS'**
  String get labelEmail;

  /// No description provided for @hintEmail.
  ///
  /// In en, this message translates to:
  /// **'name@style.com'**
  String get hintEmail;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get labelPassword;

  /// No description provided for @btnForgotPass.
  ///
  /// In en, this message translates to:
  /// **'FORGOT PASSWORD?'**
  String get btnForgotPass;

  /// No description provided for @hintPassword.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get hintPassword;

  /// No description provided for @labelOrContinue.
  ///
  /// In en, this message translates to:
  /// **'OR CONTINUE WITH'**
  String get labelOrContinue;

  /// No description provided for @btnGoogle.
  ///
  /// In en, this message translates to:
  /// **'GOOGLE'**
  String get btnGoogle;

  /// No description provided for @btnApple.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get btnApple;

  /// No description provided for @footerNewTo.
  ///
  /// In en, this message translates to:
  /// **'New to Quick Fashion? '**
  String get footerNewTo;

  /// No description provided for @footerCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get footerCreateAccount;

  /// No description provided for @bannerEdition.
  ///
  /// In en, this message translates to:
  /// **'SPRING / SUMMER EDITION\nNO. 24'**
  String get bannerEdition;

  /// No description provided for @signupCreate.
  ///
  /// In en, this message translates to:
  /// **'CREATE'**
  String get signupCreate;

  /// No description provided for @signupAccount.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get signupAccount;

  /// No description provided for @signupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join the global avant-garde. Instant access to limited drops and high-velocity style updates.'**
  String get signupSubtitle;

  /// No description provided for @labelFullName.
  ///
  /// In en, this message translates to:
  /// **'FULL NAME'**
  String get labelFullName;

  /// No description provided for @hintFullName.
  ///
  /// In en, this message translates to:
  /// **'ALEXANDER MCQUEEN'**
  String get hintFullName;

  /// No description provided for @termsIHaveRead.
  ///
  /// In en, this message translates to:
  /// **'I accept the '**
  String get termsIHaveRead;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @termsAndAcknowledge.
  ///
  /// In en, this message translates to:
  /// **' and acknowledge the '**
  String get termsAndAcknowledge;

  /// No description provided for @termsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get termsPrivacyPolicy;

  /// No description provided for @btnJoinCollective.
  ///
  /// In en, this message translates to:
  /// **'JOIN THE COLLECTIVE'**
  String get btnJoinCollective;

  /// No description provided for @footerAlreadyAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get footerAlreadyAccount;

  /// No description provided for @btnSignInSignup.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get btnSignInSignup;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'en',
    'gu',
    'hi',
    'mr',
    'pa',
    'ta',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'mr':
      return AppLocalizationsMr();
    case 'pa':
      return AppLocalizationsPa();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
