import 'package:flutter/material.dart';

import '../../../core/core.dart';

class LightsAndTimerSwitchers extends StatelessWidget {
  const LightsAndTimerSwitchers({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: const EdgeInsets.all(12),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Lights'),
            const SizedBox(height: 8),
            SHSwitcher(
              value: room.lights.isOn,
              onChanged: (value) {},
              icon: const Icon(SHIcons.lightBulbOutline),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Timer'),
                Spacer(),
                BlueLightDot(),
              ],
            ),
            const SizedBox(height: 8),
            SHSwitcher(
              icon: room.timer.isOn
                  ? const Icon(SHIcons.timer)
                  : const Icon(SHIcons.timerOff),
              value: room.timer.isOn,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
