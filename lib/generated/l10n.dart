// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in to your account`
  String get authPageLoginToAccount {
    return Intl.message(
      'Log in to your account',
      name: 'authPageLoginToAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get authPageUsername {
    return Intl.message(
      'Enter your username',
      name: 'authPageUsername',
      desc: '',
      args: [],
    );
  }

  /// `Enter the password`
  String get authPagePassword {
    return Intl.message(
      'Enter the password',
      name: 'authPagePassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get authPageLogin {
    return Intl.message(
      'Login',
      name: 'authPageLogin',
      desc: '',
      args: [],
    );
  }

  /// `By clicking «Login», you accept the terms of the\n`
  String get authPageAcceptPart {
    return Intl.message(
      'By clicking «Login», you accept the terms of the\n',
      name: 'authPageAcceptPart',
      desc: '',
      args: [],
    );
  }

  /// `privacy policy`
  String get authPagePrivacyPolicyPart {
    return Intl.message(
      'privacy policy',
      name: 'authPagePrivacyPolicyPart',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get authPagePrivacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'authPagePrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Your username`
  String get authPageYourLogin {
    return Intl.message(
      'Your username',
      name: 'authPageYourLogin',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get authPageYourPassword {
    return Intl.message(
      'Your password',
      name: 'authPageYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get authPageRegister {
    return Intl.message(
      'Register',
      name: 'authPageRegister',
      desc: '',
      args: [],
    );
  }

  /// `Your balance`
  String get profilePageYourBalance {
    return Intl.message(
      'Your balance',
      name: 'profilePageYourBalance',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get profilePageLogout {
    return Intl.message(
      'Log out',
      name: 'profilePageLogout',
      desc: '',
      args: [],
    );
  }

  /// `Delete an account`
  String get profilePageDeleteAccount {
    return Intl.message(
      'Delete an account',
      name: 'profilePageDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get profilePageInformation {
    return Intl.message(
      'Information',
      name: 'profilePageInformation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get profilePageEmail {
    return Intl.message(
      'Email',
      name: 'profilePageEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get profilePageWallet {
    return Intl.message(
      'Wallet',
      name: 'profilePageWallet',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get profilePageLegal {
    return Intl.message(
      'Legal',
      name: 'profilePageLegal',
      desc: '',
      args: [],
    );
  }

  /// `The offer Agreement`
  String get profilePageOfferAgreement {
    return Intl.message(
      'The offer Agreement',
      name: 'profilePageOfferAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Rating of participants`
  String get progressListPageRatingOfParticipants {
    return Intl.message(
      'Rating of participants',
      name: 'progressListPageRatingOfParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Global`
  String get progressListPageGlobal {
    return Intl.message(
      'Global',
      name: 'progressListPageGlobal',
      desc: '',
      args: [],
    );
  }

  /// `Within a 100-kilometer radius`
  String get progressListPageDistanceRadius {
    return Intl.message(
      'Within a 100-kilometer radius',
      name: 'progressListPageDistanceRadius',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get progressListPageUnknown {
    return Intl.message(
      'Unknown',
      name: 'progressListPageUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Nick`
  String get progressListPageNick {
    return Intl.message(
      'Nick',
      name: 'progressListPageNick',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get progressListPageScore {
    return Intl.message(
      'Score',
      name: 'progressListPageScore',
      desc: '',
      args: [],
    );
  }

  /// `Click on the dots to start the game`
  String get gamePageClickOnTheDots {
    return Intl.message(
      'Click on the dots to start the game',
      name: 'gamePageClickOnTheDots',
      desc: '',
      args: [],
    );
  }

  /// `Tap\nto go`
  String get gamePageTapToGo {
    return Intl.message(
      'Tap\nto go',
      name: 'gamePageTapToGo',
      desc: '',
      args: [],
    );
  }

  /// `Begin in: {seconds}`
  String gamePageBeginIn(Object seconds) {
    return Intl.message(
      'Begin in: $seconds',
      name: 'gamePageBeginIn',
      desc: '',
      args: [seconds],
    );
  }

  /// `{speed} tap/s`
  String gamePageTapSpeed(Object speed) {
    return Intl.message(
      '$speed tap/s',
      name: 'gamePageTapSpeed',
      desc: '',
      args: [speed],
    );
  }

  /// `Sorry`
  String get gamePageSorry {
    return Intl.message(
      'Sorry',
      name: 'gamePageSorry',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get gamePageTryAgain {
    return Intl.message(
      'Try again',
      name: 'gamePageTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `You've earned it`
  String get gamePageYouEarned {
    return Intl.message(
      'You\'ve earned it',
      name: 'gamePageYouEarned',
      desc: '',
      args: [],
    );
  }

  /// `Play more`
  String get gamePagePlayMore {
    return Intl.message(
      'Play more',
      name: 'gamePagePlayMore',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get gamePageSomethingWrong {
    return Intl.message(
      'Something went wrong',
      name: 'gamePageSomethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Determine the location`
  String get gamePageDetermineTheLocation {
    return Intl.message(
      'Determine the location',
      name: 'gamePageDetermineTheLocation',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 1`
  String get gamePageWinText1 {
    return Intl.message(
      'Keep it up 1',
      name: 'gamePageWinText1',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 2`
  String get gamePageWinText2 {
    return Intl.message(
      'Keep it up 2',
      name: 'gamePageWinText2',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 3`
  String get gamePageWinText3 {
    return Intl.message(
      'Keep it up 3',
      name: 'gamePageWinText3',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 4`
  String get gamePageWinText4 {
    return Intl.message(
      'Keep it up 4',
      name: 'gamePageWinText4',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 5`
  String get gamePageWinText5 {
    return Intl.message(
      'Keep it up 5',
      name: 'gamePageWinText5',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 6`
  String get gamePageWinText6 {
    return Intl.message(
      'Keep it up 6',
      name: 'gamePageWinText6',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 7`
  String get gamePageWinText7 {
    return Intl.message(
      'Keep it up 7',
      name: 'gamePageWinText7',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 8`
  String get gamePageWinText8 {
    return Intl.message(
      'Keep it up 8',
      name: 'gamePageWinText8',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 9`
  String get gamePageWinText9 {
    return Intl.message(
      'Keep it up 9',
      name: 'gamePageWinText9',
      desc: '',
      args: [],
    );
  }

  /// `Keep it up 10`
  String get gamePageWinText10 {
    return Intl.message(
      'Keep it up 10',
      name: 'gamePageWinText10',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 1`
  String get gamePageLooseText1 {
    return Intl.message(
      'You will succeed, try again 1',
      name: 'gamePageLooseText1',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 2`
  String get gamePageLooseText2 {
    return Intl.message(
      'You will succeed, try again 2',
      name: 'gamePageLooseText2',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 3`
  String get gamePageLooseText3 {
    return Intl.message(
      'You will succeed, try again 3',
      name: 'gamePageLooseText3',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 4`
  String get gamePageLooseText4 {
    return Intl.message(
      'You will succeed, try again 4',
      name: 'gamePageLooseText4',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 5`
  String get gamePageLooseText5 {
    return Intl.message(
      'You will succeed, try again 5',
      name: 'gamePageLooseText5',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 6`
  String get gamePageLooseText6 {
    return Intl.message(
      'You will succeed, try again 6',
      name: 'gamePageLooseText6',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 7`
  String get gamePageLooseText7 {
    return Intl.message(
      'You will succeed, try again 7',
      name: 'gamePageLooseText7',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 8`
  String get gamePageLooseText8 {
    return Intl.message(
      'You will succeed, try again 8',
      name: 'gamePageLooseText8',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 9`
  String get gamePageLooseText9 {
    return Intl.message(
      'You will succeed, try again 9',
      name: 'gamePageLooseText9',
      desc: '',
      args: [],
    );
  }

  /// `You will succeed, try again 10`
  String get gamePageLooseText10 {
    return Intl.message(
      'You will succeed, try again 10',
      name: 'gamePageLooseText10',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get registrationPageRegistration {
    return Intl.message(
      'Registration',
      name: 'registrationPageRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Repeat the password`
  String get registrationPageYourPassword {
    return Intl.message(
      'Repeat the password',
      name: 'registrationPageYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get registrationPagePasswordsDoNotMatch {
    return Intl.message(
      'Passwords don\'t match',
      name: 'registrationPagePasswordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Select a country`
  String get countryListPageSelectCountry {
    return Intl.message(
      'Select a country',
      name: 'countryListPageSelectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Detect automatically`
  String get countryListPageDetectAutomatically {
    return Intl.message(
      'Detect automatically',
      name: 'countryListPageDetectAutomatically',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get countryListPageDone {
    return Intl.message(
      'Done',
      name: 'countryListPageDone',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get countryListPageCountry {
    return Intl.message(
      'Country',
      name: 'countryListPageCountry',
      desc: '',
      args: [],
    );
  }

  /// `Select a city`
  String get cityListPageSelectCity {
    return Intl.message(
      'Select a city',
      name: 'cityListPageSelectCity',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityListPageCity {
    return Intl.message(
      'City',
      name: 'cityListPageCity',
      desc: '',
      args: [],
    );
  }

  /// `The list is empty`
  String get listPageEmptyList {
    return Intl.message(
      'The list is empty',
      name: 'listPageEmptyList',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
