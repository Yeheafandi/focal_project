import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static final Map<String, Map<String, String>> _messages = {};

  static Future<void> init() async {
    final english = await rootBundle.loadString('assets/translations/en.json');
    final arabic = await rootBundle.loadString('assets/translations/ar.json');

    _messages['en_US'] = _flattenJson(jsonDecode(english));
    _messages['en_GB'] = _messages['en_US']!;
    _messages['ar_SA'] = _flattenJson(jsonDecode(arabic));
  }

  static Map<String, String> _flattenJson(
    dynamic value, [
    String parentKey = '',
  ]) {
    final flattened = <String, String>{};

    if (value is Map) {
      for (final entry in value.entries) {
        final key = parentKey.isEmpty
            ? entry.key.toString()
            : '$parentKey.${entry.key}';
        final nestedValue = entry.value;
        if (nestedValue is Map) {
          flattened.addAll(_flattenJson(nestedValue, key));
        } else {
          flattened[key] = nestedValue.toString();
        }
      }
    }

    return flattened;
  }

  @override
  Map<String, Map<String, String>> get keys => _messages;
}
