
class GetHelpModel {
  final int status;
  final String message;
  final List<HelpModel> help;

  GetHelpModel({required this.status, required this.message, required this.help});

  factory GetHelpModel.fromJson(Map<String, dynamic> json) {
    return GetHelpModel(
      help: List<HelpModel>.from(
          json['help'].map((x) => HelpModel.fromJson(x))),
      status: json['status'],
      message: json['message'],
    );
  }
}

class HelpModel {
  final int id;
  final String question;
  final String answer;

  const HelpModel({required this.id, required this.question, required this.answer});

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}