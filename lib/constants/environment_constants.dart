import 'package:flutter/services.dart';

class EnvironmentConstants {
  String get baseUrl => appFlavor == 'dev'
      ? "https://staging.foodriver.site"
      : "https://staging.foodriver.site";
  String get privacyPolicyUrl => appFlavor == 'dev'
      ? "https://staging.foodriver.site/storage/api/v1/file/TermsofServices.pdf"
      : "https://staging.foodriver.site/storage/api/v1/file/TermsofServices.pdf";
}
