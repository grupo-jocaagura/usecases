import 'dart:async';
import 'dart:math';

/// Simula una API tipo socket con eventos periódicos
class MockSocketApi {
  MockSocketApi() {
    Timer.periodic(const Duration(seconds: 5), (_) {
      final int chance = _random.nextInt(10);
      if (chance < 3) {
        _controller.addError(Exception('Socket desconectado'));
      } else {
        _controller.add(
          <String, dynamic>{
            'code': _random.nextInt(999999).toString().padLeft(6, '0'),
            'description': 'Producto SOCKET ${_random.nextInt(100)}',
          },
        );
      }
    });
  }
  final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();
  final Random _random = Random();

  Stream<Map<String, dynamic>> get events => _controller.stream;
}
