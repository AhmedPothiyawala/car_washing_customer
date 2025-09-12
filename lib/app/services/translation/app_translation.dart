import 'package:get/get.dart';

import 'languages/en_us.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      <String, Map<String, String>>{"en_US": enUS};
}
