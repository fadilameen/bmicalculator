import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.onPressed, this.icon});

  final void Function()? onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: const Color(0xFF4c4f5e),
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
