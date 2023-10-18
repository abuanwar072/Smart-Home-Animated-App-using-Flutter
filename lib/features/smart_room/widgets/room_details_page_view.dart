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
    required this.animation,
    required this.room,
    super.key,
  });

  final Animation<double> animation;
  final SmartRoom room;

  Animation<double> get _interval1 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.4, 1, curve: Curves.easeIn),
      );

  Animation<double> get _interval2 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.6, 1, curve: Curves.easeIn),
      );

  Animation<double> get _interval3 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.8, 1, curve: Curves.easeIn),
      );

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            SlideTransition(
              position: Tween(
                begin: const Offset(-1, 1),
                end: Offset.zero,
              ).animate(animation),
              child: Align(
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
                    SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 2),
                        end: Offset.zero,
                      ).animate(_interval1),
                      child: FadeTransition(
                        opacity: _interval1,
                        child: Row(
                          children: [
                            Expanded(
                              child: LightsAndTimerSwitchers(room: room),
                            ),
                            width20,
                            Expanded(child: MusicSwitchers(room: room)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 2),
                        end: Offset.zero,
                      ).animate(_interval2),
                      child: FadeTransition(
                        opacity: _interval2,
                        child: LightIntensitySliderCard(room: room),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 2),
                        end: Offset.zero,
                      ).animate(_interval1),
                      child: FadeTransition(
                        opacity: _interval3,
                        child: AirConditionerControlsCard(room: room),
                      ),
                    ),
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
