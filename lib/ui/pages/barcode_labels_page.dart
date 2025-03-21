import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../widgets/add_barcode_button.dart';
import '../widgets/barcode_list_view_widget.dart';

class BarcodeLabelsPage extends StatelessWidget {
  const BarcodeLabelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const InlineTextWidget('Etiquetas de Códigos de Barra'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const BarcodeListViewWidget(),
      ),
      floatingActionButton: const AddBarcodeButton(),
    );
  }
}
