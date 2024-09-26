import 'package:flutter/services.dart';

class EnvironmentConstants {
  String get baseUrl => appFlavor == 'dev'
      ? "https://staging.foodriver.site"
      : "https://mobile-foodriver.site";
  String get privacyPolicyUrl => appFlavor == 'dev'
      ? 'https://docs.google.com/document/d/1qSL6NuTXbz10P7tkUCSWzOj8oDUARSx3eVM3IFfAoKA/edit'
      : 'https://docs.google.com/document/d/1qSL6NuTXbz10P7tkUCSWzOj8oDUARSx3eVM3IFfAoKA/edit';
  // String get privacyPolicyUrl => appFlavor == 'dev'
  //     ? "https://staging.foodriver.site/storage/api/v1/file/TermsofServices.pdf"
  //     : "https://staging.foodriver.site/storage/api/v1/file/TermsofServices.pdf";
}
