import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool loading;
  final bool disabled;
  final String label;
  final void Function() onPress;

  const PrimaryButton({super.key, this.loading = false, this.disabled = false, this.label = '', required this.onPress});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        foregroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFF6F9520)
            : Colors.black,
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFBADB76)
            : const Color(0xFFE59F84),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      onPressed: disabled || loading ? null : onPress,
      child: loading
          ? const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      )
          : Text(label),
    );
  }
}
