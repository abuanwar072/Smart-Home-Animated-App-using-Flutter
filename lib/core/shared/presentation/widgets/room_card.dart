import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_home_animation/features/home/presentation/widgets/background_room_lights.dart';
import 'package:ui_common/ui_common.dart';

import '../../../../features/smart_room/screens/room_details_screen.dart';
import '../../../core.dart';
import 'shimmer_arrows.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    required this.percent,
    required this.room,
    required this.expand,
    required this.onSwipeUp,
    required this.onSwipeDown,
    required this.onTap,
    super.key,
  });

  final double percent;
  final SmartRoom room;
  final VoidCallback onSwipeUp;
  final VoidCallback onSwipeDown;
  final VoidCallback onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 0, end: expand ? 1 : 0),
      builder: (_, value, __) => Stack(
        fit: StackFit.expand,
        children: [
          // -----------------------------------------------
          // Background information card
          // -----------------------------------------------
          Transform.scale(
            scale: lerpDouble(.85, 1.2, value),
            // scale: 0.85,

            child: Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child: BackgroundRoomCard(room: room, translation: value),
            ),
          ),
          // -----------------------------------------------
          // Room image card with parallax effect
          // -----------------------------------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 200),
            child: Transform(
              transform: Matrix4.translationValues(0, -90 * value, 0),
              child: GestureDetector(
                onTap: onTap,
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta! < -10) onSwipeUp();
                  if (details.primaryDelta! > 10) onSwipeDown();
                },
                child: Hero(
                  tag: room.id,
                  // -----------------------------------------------
                  // Custom hero widget
                  // -----------------------------------------------
                  flightShuttleBuilder: (_, animation, __, ___, ____) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, _) => Material(
                        type: MaterialType.transparency,
                        child: RoomDetailItems(
                          animation: animation,
                          topPadding: context.mediaQuery.padding.top,
                          room: room,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      ParallaxImageCard(
                        imageUrl: room.imageUrl,
                        parallaxValue: percent,
                      ),
                      VerticalRoomTitle(room: room),
                      const CameraIconButton(),
                      const AnimatedUpwardArrows()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

class CameraIconButton extends StatelessWidget {
  const CameraIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            SHIcons.camera,
            color: SHColors.textColor,
          ),
        ),
      ),
    );
  }
}

class VerticalRoomTitle extends StatelessWidget {
  const VerticalRoomTitle({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    // final dx = 50 * animationValue;
    // final opacity = 1 - animationValue;
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: -1,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 40.h, right: 20.h, top: 12.w),
            child: Text(
              room.name.replaceAll(' ', ''),
              maxLines: 1,
              style: context.displayLarge.copyWith(color: SHColors.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
