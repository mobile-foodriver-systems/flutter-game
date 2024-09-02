import 'package:flutter/services.dart';

class EnvironmentConstants {
  String get baseUrl => appFlavor == 'dev'
      ? "https://staging.foodriver.site"
      : "https://staging.foodriver.site";
  String get privacyPolicyUrl => appFlavor == 'dev'
      ? "https://staging.foodriver.site/game/api/v1/files/TermsofServices.pdf"
      : "https://staging.foodriver.site/game/api/v1/files/TermsofServices.pdf";
}
