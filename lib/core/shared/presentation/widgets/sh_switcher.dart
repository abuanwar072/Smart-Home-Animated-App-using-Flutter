import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core.dart';

class SHSwitcher extends StatelessWidget {
  const SHSwitcher({
    required this.value,
    required this.onChanged,
    this.icon,
    super.key,
  });

  final bool value;
  final Icon? icon;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(
                color: value ? SHColors.selectedColor : Colors.white38,
              ),
              child: icon!,
            ),
            const SizedBox(width: 8),
          ],
          CupertinoSwitch(
            trackColor: SHColors.trackColor,
            activeColor: SHColors.trackColor,
            thumbColor: value ? null : Colors.white60,
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(width: 8),
          Text(
            value ? 'ON' : 'OFF',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: value ? SHColors.selectedColor : Colors.white38,
            ),
          )
        ],
      ),
    );
  }
}
