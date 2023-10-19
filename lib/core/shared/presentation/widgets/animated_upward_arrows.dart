import 'package:flutter/material.dart';

import '../../../core.dart';
import 'shimmer_arrows.dart';

class AnimatedUpwardArrows extends StatelessWidget {
  const AnimatedUpwardArrows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ShimmerArrows(),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 4,
            width: 120,
            decoration: const BoxDecoration(
              color: SHColors.textColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
