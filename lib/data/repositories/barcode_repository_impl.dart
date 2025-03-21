import 'package:flutter/material.dart';

import '../../domain/gateways/barcode_gateway.dart';
import '../../domain/models/barcode_model.dart';
import '../../domain/repositories/barcode_repository_interface.dart';

class BarcodeRepositoryImpl implements BarcodeRepositoryInterface {
  BarcodeRepositoryImpl({required this.gateway});

  final BarcodeGateway gateway;

  @override
  Future<List<BarcodeModel>> getBarcodes() async {
    debugPrint('🐱‍👤 Ejecutando la implementacion del repositorio');
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
    debugPrint('🐱‍👤 $data ${data.runtimeType}');
    debugPrint('🐱‍👤 $barcodeList ${barcodeList.runtimeType}');
    return barcodeList;
  }
}
