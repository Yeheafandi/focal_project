class LanguageHelper {
  static String getLanguageLabelKey(String code) {
    const labels = {
      'ar': 'arabic',
      'en': 'english',
    };
    return labels[code] ?? 'english';
  }
}
