import 'package:flutter/material.dart';

import '../entities/usecase.dart';
import '../models/barcode_model.dart';
import '../repositories/barcode_repository_interface.dart';

/// Caso de uso para obtener códigos de barras.
///
/// Este caso de uso encapsula la lógica de negocio para recuperar la lista de códigos de barras.
///
/// Ejemplo de uso:
/// ```dart
/// final usecase = GetBarcodesUsecase(repository);
/// final barcodes = await usecase.execute();
/// ```
class GetBarcodesUsecase implements Usecase {
  const GetBarcodesUsecase(this.repository);
  final BarcodeRepositoryInterface repository;

  Future<List<BarcodeModel>> execute() async {
    debugPrint('🐱‍👤 Ejecutando caso de uso');
    await Future<void>.delayed(const Duration(seconds: 2));
    return repository.getBarcodes();
  }
}
