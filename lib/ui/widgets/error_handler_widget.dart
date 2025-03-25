import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../domain/models/error_item.dart';
import '../../viewmodels/barcode_viewmodel_failure.dart';

class ErrorHandlerWidget extends StatelessWidget {
  const ErrorHandlerWidget({
    required this.child,
    required this.viewModel,
    super.key,
  });

  final Widget child;
  final BarcodeViewModelFailure viewModel;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ErrorItem? error = viewModel.error;
      if (error != null) {
        if (error.type == ErrorType.toast) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: InlineTextWidget(error.description),
              duration: const Duration(seconds: 3),
            ),
          );
          viewModel.clearError();
        } else if (error.type == ErrorType.blocking) {
          showDialog(
            context: context,
            builder: (BuildContext ctx) => AlertDialog(
              title: InlineTextWidget(error.title),
              content: InlineTextWidget(error.description),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    viewModel.clearError();
                  },
                  child: const InlineTextWidget('Aceptar'),
                ),
              ],
            ),
          );
        }
      }
    });

    return child;
  }
}
