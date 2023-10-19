import 'package:flutter/material.dart';

import '../../../../core/shared/domain/entities/smart_room.dart';
import '../../../../core/shared/presentation/widgets/room_card.dart';
import '../../../smart_room/screens/room_details_screen.dart';

class SmartRoomsPageView extends StatelessWidget {
  const SmartRoomsPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      clipBehavior: Clip.none,
      itemCount: SmartRoom.fakeValues.length,
      itemBuilder: (_, index) {
        final room = SmartRoom.fakeValues[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RoomCard(
            percent: 0,
            expand: false,
            room: room,
            onSwipeUp: () {},
            onSwipeDown: () {},
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetailScreen(room: room),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
