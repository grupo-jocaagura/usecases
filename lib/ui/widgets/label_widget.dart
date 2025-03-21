import 'package:flutter/material.dart';

import '../../domain/models/barcode_model.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    required this.barcode,
    super.key,
  });
  final BarcodeModel barcode;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.qr_code),
        title: Text(barcode.code),
        subtitle: Text(barcode.description),
      ),
    );
  }
}
