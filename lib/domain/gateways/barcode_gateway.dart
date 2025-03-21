abstract class BarcodeGateway {
  const BarcodeGateway();
  Future<List<Map<String, dynamic>>> fetchBarcodesFromApi();
}
