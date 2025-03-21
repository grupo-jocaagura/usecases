import 'package:flutter/material.dart';

import '../entities/usecase.dart';
import '../models/barcode_model.dart';
import '../repositories/barcode_repository_interface.dart';

class GetBarcodesUsecase implements Usecase {
  const GetBarcodesUsecase(this.repository);
  final BarcodeRepositoryInterface repository;

  Future<List<BarcodeModel>> execute() async {
    debugPrint('🐱‍👤 Ejecutando caso de uso');
    await Future<void>.delayed(const Duration(seconds: 2));
    return repository.getBarcodes();
  }
}
