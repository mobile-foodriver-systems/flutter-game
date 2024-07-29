// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(seconds) => "Begin in: ${seconds}";

  static String m1(speed) => "${speed} tap/s";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authPageAcceptPart": MessageLookupByLibrary.simpleMessage(
            "By clicking «Login», you accept the terms of the\n"),
        "authPageLogin": MessageLookupByLibrary.simpleMessage("Login"),
        "authPageLoginToAccount":
            MessageLookupByLibrary.simpleMessage("Log in to your account"),
        "authPagePassword":
            MessageLookupByLibrary.simpleMessage("Enter the password"),
        "authPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "authPagePrivacyPolicyPart":
            MessageLookupByLibrary.simpleMessage("privacy policy"),
        "authPageUsername":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "gamePageBeginIn": m0,
        "gamePageClickOnTheDots": MessageLookupByLibrary.simpleMessage(
            "Click on the dots to start the game"),
        "gamePageLost": MessageLookupByLibrary.simpleMessage("You\'ve lost"),
        "gamePagePlayMore": MessageLookupByLibrary.simpleMessage("Play more"),
        "gamePageSomethingWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "gamePageTapSpeed": m1,
        "gamePageTapToGo": MessageLookupByLibrary.simpleMessage("Tap\nto go"),
        "gamePageTryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "gamePageYourReward":
            MessageLookupByLibrary.simpleMessage("Your reward"),
        "profilePageDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Delete an account"),
        "profilePageEmail": MessageLookupByLibrary.simpleMessage("Email"),
        "profilePageInformation":
            MessageLookupByLibrary.simpleMessage("Information"),
        "profilePageLegal": MessageLookupByLibrary.simpleMessage("Legal"),
        "profilePageLogout": MessageLookupByLibrary.simpleMessage("Log out"),
        "profilePageOfferAgreement":
            MessageLookupByLibrary.simpleMessage("The offer Agreement"),
        "profilePageWallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "profilePageYourBalance":
            MessageLookupByLibrary.simpleMessage("Your balance"),
        "progressListPageDistanceRadius": MessageLookupByLibrary.simpleMessage(
            "Within a 100-kilometer radius"),
        "progressListPageGlobal":
            MessageLookupByLibrary.simpleMessage("Global"),
        "progressListPageNick": MessageLookupByLibrary.simpleMessage("Nick"),
        "progressListPageRatingOfParticipants":
            MessageLookupByLibrary.simpleMessage("Rating of participants"),
        "progressListPageScore": MessageLookupByLibrary.simpleMessage("Score"),
        "progressListPageUnknown":
            MessageLookupByLibrary.simpleMessage("Unknown")
      };
}
