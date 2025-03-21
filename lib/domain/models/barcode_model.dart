import '../entities/model.dart';

class BarcodeModel extends Model {
  BarcodeModel({
    required this.code,
    required this.description,
  });
  final String code;
  final String description;
}
