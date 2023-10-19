import 'package:flutter/material.dart';

import '../../../theme/sh_icons.dart';

class ShimmerArrows extends StatefulWidget {
  const ShimmerArrows({super.key});

  @override
  State<ShimmerArrows> createState() => _ShimmerArrowsState();
}

class _ShimmerArrowsState extends State<ShimmerArrows> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white10, Colors.white, Colors.white10],
        stops: [0.0, 0.3, 1],
      ).createShader(bounds),
      child: const Column(
        children: [
          Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
          Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
          Align(heightFactor: .4, child: Icon(SHIcons.arrowUp)),
        ],
      ),
    );
  }
}
