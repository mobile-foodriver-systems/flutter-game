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

  /// `You've lost`
  String get gamePageLost {
    return Intl.message(
      'You\'ve lost',
      name: 'gamePageLost',
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

  /// `Your reward`
  String get gamePageYourReward {
    return Intl.message(
      'Your reward',
      name: 'gamePageYourReward',
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
