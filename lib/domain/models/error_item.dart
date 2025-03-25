import '../entities/model.dart';

enum ErrorType {
  toast,
  blocking,
}

class ErrorItem extends Model {
  const ErrorItem({
    required this.title,
    required this.code,
    required this.description,
    this.meta = const <String, dynamic>{},
    this.type = ErrorType.toast,
  });

  final String title;
  final String code;
  final String description;
  final Map<String, dynamic> meta;
  final ErrorType type;

  @override
  String toString() {
    return '$title ($code): $description'
        '${meta.isNotEmpty ? " | Meta: $meta" : ""}';
  }
}
