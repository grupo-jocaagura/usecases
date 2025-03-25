import 'dart:async';
import 'dart:math';

/// Simula una API tipo HTTP
class MockHttpApi {
  final Random _random = Random();

  Future<Map<String, dynamic>> getData() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final int chance = _random.nextInt(10);
    if (chance < 2) {
      throw Exception('Timeout de red');
    } else if (chance < 4) {
      return <String, dynamic>{'unexpected_key': 'Oops'}; // JSON mal formado
    } else if (chance < 6) {
      throw Exception('Error 500 - Servidor');
    } else {
      return <String, dynamic>{
        'code': _random.nextInt(999999).toString().padLeft(6, '0'),
        'description': 'Producto HTTP ${_random.nextInt(100)}',
      };
    }
  }
}
