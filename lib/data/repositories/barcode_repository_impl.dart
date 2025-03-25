import 'package:flutter/material.dart';

import '../../domain/gateways/barcode_gateway.dart';
import '../../domain/models/barcode_model.dart';
import '../../domain/repositories/barcode_repository_interface.dart';

/// Implementación del repositorio que obtiene los códigos de barras del Gateway.
///
/// Este repositorio convierte los datos obtenidos del Gateway en modelos de dominio.
///
/// Ejemplo de uso:
/// ```dart
/// final repository = BarcodeRepositoryImpl(gateway: BarcodeGatewayImpl());
/// final barcodes = await repository.getBarcodes();
/// ```
class BarcodeRepositoryImpl implements BarcodeRepositoryInterface {
  BarcodeRepositoryImpl({required this.gateway});

  final BarcodeGateway gateway;

  @override
  Future<List<BarcodeModel>> getBarcodes() async {
    debugPrint('🐱‍👤 Ejecutando la implementación del repositorio');
    final List<Map<String, dynamic>> data =
        await gateway.fetchBarcodesFromApi();
    final List<BarcodeModel> barcodeList = data
        .map(
          (Map<String, dynamic> json) => BarcodeModel(
            code: json['code'].toString(),
            description: json['description'].toString(),
          ),
        )
        .toList();
    return barcodeList;
  }

  @override
  Future<List<BarcodeModel>> generateNewBarcodes() async {
    final List<Map<String, dynamic>> data =
        await gateway.fetchBarcodesFromApi();
    return data
        .map(
          (Map<String, dynamic> json) => BarcodeModel(
            code: json['code'].toString(),
            description: json['description'].toString(),
          ),
        )
        .toList();
  }
}
