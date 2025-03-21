import 'package:flutter/foundation.dart';

import '../models/barcode_model.dart';
import '../repositories/barcode_repository_interface.dart';

/// Caso de uso para generar códigos de barras aleatorios dinámicamente.
class GenerateNewBarcodesUsecase {
  GenerateNewBarcodesUsecase(this.repository);
  final BarcodeRepositoryInterface repository;

  Future<List<BarcodeModel>> execute() async {
    debugPrint('🐱‍👤 Ejecutando caso de uso para generar nuevos códigos...');
    await Future<void>.delayed(const Duration(seconds: 1));
    return repository.generateNewBarcodes();
  }
}
