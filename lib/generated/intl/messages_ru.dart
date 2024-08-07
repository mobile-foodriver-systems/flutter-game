// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(seconds) => "Старт через: ${seconds}";

  static String m1(speed) => "${speed} клк/сек";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authPageAcceptPart": MessageLookupByLibrary.simpleMessage(
            "Нажимая «Войти», Вы принимаете условия\n"),
        "authPageLogin": MessageLookupByLibrary.simpleMessage("Войти"),
        "authPageLoginToAccount":
            MessageLookupByLibrary.simpleMessage("Вход в аккаунт"),
        "authPagePassword":
            MessageLookupByLibrary.simpleMessage("Введите пароль"),
        "authPagePrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("Политика конфиденциальности"),
        "authPagePrivacyPolicyPart":
            MessageLookupByLibrary.simpleMessage("политики конфиденциальности"),
        "authPageRegister":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "authPageUsername":
            MessageLookupByLibrary.simpleMessage("Введите логин"),
        "authPageYourLogin": MessageLookupByLibrary.simpleMessage("Ваш логин"),
        "authPageYourPassword":
            MessageLookupByLibrary.simpleMessage("Ваш пароль"),
        "cityListPageSelectCity":
            MessageLookupByLibrary.simpleMessage("Выберите город"),
        "countryListPageDetectAutomatically":
            MessageLookupByLibrary.simpleMessage("Определить автоматически"),
        "countryListPageDone": MessageLookupByLibrary.simpleMessage("Готово"),
        "countryListPageSelectCountry":
            MessageLookupByLibrary.simpleMessage("Выберите страну"),
        "gamePageBeginIn": m0,
        "gamePageClickOnTheDots": MessageLookupByLibrary.simpleMessage(
            "Жмите на точки для начала игры"),
        "gamePageLost": MessageLookupByLibrary.simpleMessage("Вы проиграли"),
        "gamePagePlayMore": MessageLookupByLibrary.simpleMessage("Играть еще"),
        "gamePageSomethingWrong":
            MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
        "gamePageTapSpeed": m1,
        "gamePageTapToGo":
            MessageLookupByLibrary.simpleMessage("Кликай\nчтобы ехать"),
        "gamePageTryAgain":
            MessageLookupByLibrary.simpleMessage("Попробовать снова"),
        "gamePageYourReward":
            MessageLookupByLibrary.simpleMessage("Ваша награда"),
        "profilePageDeleteAccount":
            MessageLookupByLibrary.simpleMessage("Удалить аккаунт"),
        "profilePageEmail": MessageLookupByLibrary.simpleMessage("Почта"),
        "profilePageInformation":
            MessageLookupByLibrary.simpleMessage("Данные"),
        "profilePageLegal": MessageLookupByLibrary.simpleMessage("Юридическое"),
        "profilePageLogout":
            MessageLookupByLibrary.simpleMessage("Выйти из аккаунта"),
        "profilePageOfferAgreement":
            MessageLookupByLibrary.simpleMessage("Договор оферты"),
        "profilePageWallet": MessageLookupByLibrary.simpleMessage("Кошелек"),
        "profilePageYourBalance":
            MessageLookupByLibrary.simpleMessage("Ваш баланс"),
        "progressListPageDistanceRadius":
            MessageLookupByLibrary.simpleMessage("В радиусе 100 км"),
        "progressListPageGlobal":
            MessageLookupByLibrary.simpleMessage("Глобальный"),
        "progressListPageNick": MessageLookupByLibrary.simpleMessage("Ник"),
        "progressListPageRatingOfParticipants":
            MessageLookupByLibrary.simpleMessage("Рейтинг участников"),
        "progressListPageScore":
            MessageLookupByLibrary.simpleMessage("Рейтинг"),
        "progressListPageUnknown":
            MessageLookupByLibrary.simpleMessage("Неизвестно"),
        "registrationPagePasswordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("Пароли не совпадают"),
        "registrationPageRegistration":
            MessageLookupByLibrary.simpleMessage("Регистрация"),
        "registrationPageYourPassword":
            MessageLookupByLibrary.simpleMessage("Повторите пароль")
      };
}
