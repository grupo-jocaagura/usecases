import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/gateways/barcode_gateway.dart';

class BarcodeGatewayImpl implements BarcodeGateway {
  /// Simula una API devolviendo una lista de códigos de barras.
  @override
  Future<List<Map<String, dynamic>>> fetchBarcodesFromApi() async {
    debugPrint('🐱‍👤 Ejecutando el gateway');
    await Future<void>.delayed(
      const Duration(seconds: 2),
    );
    return <Map<String, dynamic>>[
      <String, dynamic>{'code': '123456', 'description': 'Producto A'},
      <String, dynamic>{'code': '789012', 'description': 'Producto B'},
    ];
  }
}
