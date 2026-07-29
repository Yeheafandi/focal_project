/// موديل سؤال وجواب لصفحة Help and Support
class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});

  factory FaqItem.fromJson(Map<String, dynamic> json) {
    return FaqItem(
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }
}