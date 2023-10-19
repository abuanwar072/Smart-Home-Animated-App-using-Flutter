import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

import '../../../core/shared/domain/entities/smart_room.dart';
import 'air_conditiioner_controls_card.dart';
import 'light_and_time_switcher.dart';
import 'light_intensity_slide_card.dart';
import 'music_switchers.dart';

class RoomDetailsPageView extends StatelessWidget {
  const RoomDetailsPageView({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                ),
                icon: const Icon(Icons.keyboard_arrow_left),
                label: const Text('BACK'),
              ),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: LightsAndTimerSwitchers(room: room),
                        ),
                        width20,
                        Expanded(child: MusicSwitchers(room: room)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    LightIntensitySliderCard(room: room),
                    const SizedBox(height: 20),
                    AirConditionerControlsCard(room: room),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
