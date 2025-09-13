import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> showConfirmRemoveFavoriteDialog({
  required BuildContext context,
  required String coinName,
  required String title,
  required String confirmLabel,
  required String cancelLabel,
  bool barrierDismissible = true,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) {
      return _ConfirmRemoveFavoriteDialog(
        title: title,
        content: context.l10n.confirmRemoveMessage(coinName),
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
      );
    },
  );
}

class _ConfirmRemoveFavoriteDialog extends StatelessWidget {
  const _ConfirmRemoveFavoriteDialog({
    required this.title,
    required this.content,
    required this.confirmLabel,
    required this.cancelLabel,
  });

  final String title;
  final String content;
  final String confirmLabel;
  final String cancelLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final errorColor = colorScheme.error;
    return AlertDialog(
      title: Row(
        spacing: 12,
        children: [
          Icon(Icons.delete_outline, color: errorColor),
          Expanded(child: Text(title)),
        ],
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(cancelLabel),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: errorColor,
            foregroundColor: colorScheme.onError,
          ),
          onPressed: () => context.pop(true),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
