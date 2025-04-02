import 'dart:async';
import 'dart:math';

int errorChange = 6;

/// Simula una API tipo HTTP
class MockHttpApi {
  final Random _random = Random();

  Future<Map<String, dynamic>> getData() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final int chance = _random.nextInt(10);
    if (chance < errorChange - 4) {
      throw Exception('Timeout de red');
    } else if (chance < errorChange - 2) {
      return <String, dynamic>{'unexpected_key': 'Oops'}; // JSON mal formado
    } else if (chance < errorChange) {
      throw Exception('Error 500 - Servidor');
    } else {
      return <String, dynamic>{
        'code': _random.nextInt(999999).toString().padLeft(6, '0'),
        'description': 'Producto HTTP ${_random.nextInt(100)}',
      };
    }
  }
}
