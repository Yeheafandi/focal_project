/// موديل قسم واحد من الشروط والسياسات (عنوان + نص)
class LegalSection {
  final String title;
  final String body;

  LegalSection({required this.title, required this.body});

  factory LegalSection.fromJson(Map<String, dynamic> json) {
    return LegalSection(
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}