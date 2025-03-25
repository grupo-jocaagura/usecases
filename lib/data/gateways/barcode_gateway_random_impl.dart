import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/gateways/barcode_gateway.dart';

/// Implementación de un Gateway que genera códigos de barras aleatorios dinámicos.
class BarcodeGatewayRandomImpl implements BarcodeGateway {
  final Random _random = Random();

  /// Genera entre 1 y 3 códigos de barras aleatorios con descripciones aleatorias.
  @override
  Future<List<Map<String, dynamic>>> fetchBarcodesFromApi() async {
    debugPrint('🐱‍👤 Generando códigos de barras aleatorios...');
    await Future<void>.delayed(const Duration(seconds: 2));

    final int count = _random.nextInt(3) + 1;
    return List<Map<String, dynamic>>.generate(count, (int index) {
      return <String, dynamic>{
        'code': _random.nextInt(999999).toString().padLeft(6, '0'),
        'description': 'Producto ${_random.nextInt(100)}',
      };
    });
  }
}
