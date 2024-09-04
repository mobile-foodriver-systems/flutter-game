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
  final String? gamePageSorry;
  final String? gamePageTryAgain;
  final String? gamePageYouEarned;
  final String? gamePagePlayMore;
  final String? gamePageSomethingWrong;
  final String? gamePageDetermineTheLocation;
  final String? gamePageWinText1;
  final String? gamePageWinText2;
  final String? gamePageWinText3;
  final String? gamePageWinText4;
  final String? gamePageWinText5;
  final String? gamePageWinText6;
  final String? gamePageWinText7;
  final String? gamePageWinText8;
  final String? gamePageWinText9;
  final String? gamePageWinText10;
  final String? gamePageLooseText1;
  final String? gamePageLooseText2;
  final String? gamePageLooseText3;
  final String? gamePageLooseText4;
  final String? gamePageLooseText5;
  final String? gamePageLooseText6;
  final String? gamePageLooseText7;
  final String? gamePageLooseText8;
  final String? gamePageLooseText9;
  final String? gamePageLooseText10;
  final String? gamePageDeliverAnother;
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
  final String? gamePagePrizeFund;
  final String? gamePageShortDescription;
  final String? gamePageAmount;
  final String? gamePageAmountValue;
  final String? gamePagePrizeFundText;
  final String? profilePageLogin;
  final String? profilePageChangeData;
  final String? profilePageSaveChanges;
  final String? profilePageConfirmationCode;
  final String? profilePageSentTo;
  final String? profilePageConfirm;
  final String? profilePageResend;
  final String? profilePageDataChanged;
  final String? profilePageOk;
  final String? authPageRecoverPassword;
  final String? passwordRecoveryPagePasswordRecovery;
  final String? passwordRecoveryPageYourEmail;
  final String? passwordRecoveryPageNewPassword;
  final String? passwordRecoveryPageRepeatPassword;
  final String? passwordRecoveryPageChange;
  final String? passwordRecoveryPageSetEmail;
  final String? passwordRecoveryPageEnterPassword;
  final String? profilePageGameRules;
  final String? profilePageGameRulesText;

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
    this.gamePageSorry,
    this.gamePageTryAgain,
    this.gamePageYouEarned,
    this.gamePagePlayMore,
    this.gamePageSomethingWrong,
    this.gamePageDetermineTheLocation,
    this.gamePageWinText1,
    this.gamePageWinText2,
    this.gamePageWinText3,
    this.gamePageWinText4,
    this.gamePageWinText5,
    this.gamePageWinText6,
    this.gamePageWinText7,
    this.gamePageWinText8,
    this.gamePageWinText9,
    this.gamePageWinText10,
    this.gamePageLooseText1,
    this.gamePageLooseText2,
    this.gamePageLooseText3,
    this.gamePageLooseText4,
    this.gamePageLooseText5,
    this.gamePageLooseText6,
    this.gamePageLooseText7,
    this.gamePageLooseText8,
    this.gamePageLooseText9,
    this.gamePageLooseText10,
    this.gamePageDeliverAnother,
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
    this.gamePagePrizeFund,
    this.gamePageShortDescription,
    this.gamePageAmount,
    this.gamePageAmountValue,
    this.gamePagePrizeFundText,
    this.profilePageLogin,
    this.profilePageChangeData,
    this.profilePageSaveChanges,
    this.profilePageConfirmationCode,
    this.profilePageSentTo,
    this.profilePageConfirm,
    this.profilePageResend,
    this.profilePageDataChanged,
    this.profilePageOk,
    this.authPageRecoverPassword,
    this.passwordRecoveryPagePasswordRecovery,
    this.passwordRecoveryPageYourEmail,
    this.passwordRecoveryPageNewPassword,
    this.passwordRecoveryPageRepeatPassword,
    this.passwordRecoveryPageChange,
    this.passwordRecoveryPageSetEmail,
    this.passwordRecoveryPageEnterPassword,
    this.profilePageGameRules,
    this.profilePageGameRulesText,
  );

  factory PhrasesDictionary.fromJson(Map<String, dynamic> json) =>
      _$PhrasesDictionaryFromJson(json);
  Map<String, dynamic> toJson() => _$PhrasesDictionaryToJson(this);
}
