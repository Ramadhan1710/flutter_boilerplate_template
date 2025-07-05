import 'package:flutter/material.dart';

enum ButtonType { elevated, outlined, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final ButtonType type;
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.type = ButtonType.elevated,
    this.color,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final btnChild = isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(
            text,
            style: textStyle ?? const TextStyle(fontSize: 16),
          );

    final btnStyle = ButtonStyle(
      backgroundColor: type == ButtonType.text
          ? null
          : WidgetStateProperty.all(
              isEnabled ? (color ?? Theme.of(context).primaryColor) : Colors.grey),
      padding: WidgetStateProperty.all(padding),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );

    switch (type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          style: btnStyle,
          child: btnChild,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          style: btnStyle,
          child: btnChild,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: isEnabled && !isLoading ? onPressed : null,
          style: btnStyle,
          child: btnChild,
        );
    }
  }
}
