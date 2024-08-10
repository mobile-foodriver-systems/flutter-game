import 'package:json_annotation/json_annotation.dart';

part 'phrases_dictionary.g.dart';

@JsonSerializable()
class PhrasesDictionary {
  final String? authPageLoginToAccount;
  final String? authPagePassword;
  final String? authPageUsername;
  final String? authPageLogin;
  final String? authPageAcceptPart;
  final String? authPagePrivacyPolicyPart;
  final String? authPagePrivacyPolicy;
  final String? authPageYourLogin;
  final String? authPageYourPassword;
  final String? profilePageYourBalance;
  final String? authPageRegister;
  final String? profilePageLogout;
  final String? profilePageDeleteAccount;
  final String? profilePageInformation;
  final String? profilePageEmail;
  final String? profilePageWallet;
  final String? profilePageLegal;
  final String? profilePageOfferAgreement;
  final String? progressListPageRatingOfParticipants;
  final String? progressListPageGlobal;
  final String? progressListPageDistanceRadius;
  final String? progressListPageUnknown;
  final String? progressListPageNick;
  final String? progressListPageScore;
  final String? gamePageClickOnTheDots;
  final String? gamePageTapToGo;
  final String? gamePageBeginIn;
  final String? gamePageTapSpeed;
  final String? gamePageLost;
  final String? gamePageTryAgain;
  final String? gamePageYourReward;
  final String? gamePagePlayMore;
  final String? gamePageSomethingWrong;
  final String? gamePageDetermineTheLocation;
  final String? registrationPageRegistration;
  final String? registrationPageYourPassword;
  final String? registrationPagePasswordsDoNotMatch;
  final String? countryListPageSelectCountry;
  final String? countryListPageDetectAutomatically;
  final String? countryListPageDone;
  final String? countryListPageCountry;
  final String? cityListPageSelectCity;
  final String? cityListPageCity;
  final String? listPageEmptyList;

  PhrasesDictionary(
    this.authPageLoginToAccount,
    this.authPagePassword,
    this.authPageUsername,
    this.authPageLogin,
    this.authPageAcceptPart,
    this.authPagePrivacyPolicyPart,
    this.authPagePrivacyPolicy,
    this.authPageYourLogin,
    this.authPageYourPassword,
    this.profilePageYourBalance,
    this.authPageRegister,
    this.profilePageLogout,
    this.profilePageDeleteAccount,
    this.profilePageInformation,
    this.profilePageEmail,
    this.profilePageWallet,
    this.profilePageLegal,
    this.profilePageOfferAgreement,
    this.progressListPageRatingOfParticipants,
    this.progressListPageGlobal,
    this.progressListPageDistanceRadius,
    this.progressListPageUnknown,
    this.progressListPageNick,
    this.progressListPageScore,
    this.gamePageClickOnTheDots,
    this.gamePageTapToGo,
    this.gamePageBeginIn,
    this.gamePageTapSpeed,
    this.gamePageLost,
    this.gamePageTryAgain,
    this.gamePageYourReward,
    this.gamePagePlayMore,
    this.gamePageSomethingWrong,
    this.gamePageDetermineTheLocation,
    this.registrationPageRegistration,
    this.registrationPageYourPassword,
    this.registrationPagePasswordsDoNotMatch,
    this.countryListPageSelectCountry,
    this.countryListPageDetectAutomatically,
    this.countryListPageDone,
    this.countryListPageCountry,
    this.cityListPageSelectCity,
    this.cityListPageCity,
    this.listPageEmptyList,
  );

  factory PhrasesDictionary.fromJson(Map<String, dynamic> json) =>
      _$PhrasesDictionaryFromJson(json);
  Map<String, dynamic> toJson() => _$PhrasesDictionaryToJson(this);
}
