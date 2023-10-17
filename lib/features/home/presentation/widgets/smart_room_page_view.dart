import 'package:flutter/material.dart';

import '../../../../core/shared/domain/entities/smart_room.dart';
import '../../../../core/shared/presentation/widgets/room_card.dart';
import '../../../smart_room/screens/room_details_screen.dart';

class SmartRoomsPageView extends StatelessWidget {
  const SmartRoomsPageView({
    super.key,
    required this.pageNotifier,
    required this.roomSelectorNotifier,
    required this.controller,
  });

  final ValueNotifier<double> pageNotifier;
  final ValueNotifier<int> roomSelectorNotifier;
  final PageController controller;

  double _getOffsetX(double percent) => percent.isNegative ? 30.0 : -30.0;

  Matrix4 _getOutTranslate(double percent, int selected, int index) {
    final x = selected != index && selected != -1 ? _getOffsetX(percent) : 0.0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageNotifier,
      builder: (_, page, __) => ValueListenableBuilder(
        valueListenable: roomSelectorNotifier,
        builder: (_, selected, __) => PageView.builder(
          clipBehavior: Clip.none,
          itemCount: SmartRoom.fakeValues.length,
          controller: controller,
          itemBuilder: (_, index) {
            final percent = page - index;
            final isSelected = selected == index;
            final room = SmartRoom.fakeValues[index];
            return AnimatedContainer(
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              transform: _getOutTranslate(percent, selected, index),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RoomCard(
                percent: percent,
                expand: isSelected,
                room: room,
                onSwipeUp: () => roomSelectorNotifier.value = index,
                onSwipeDown: () => roomSelectorNotifier.value = -1,
                onTap: () async {
                  if (isSelected) {
                    await Navigator.push(
                      context,
                      PageRouteBuilder<void>(
                        transitionDuration: const Duration(milliseconds: 800),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 800),
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: RoomDetailScreen(room: room),
                        ),
                      ),
                    );
                    roomSelectorNotifier.value = -1;
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
