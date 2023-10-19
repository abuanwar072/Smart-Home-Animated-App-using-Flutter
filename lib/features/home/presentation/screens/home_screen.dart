import 'package:flutter/material.dart';
import 'package:smart_home_animation/core/core.dart';
import 'package:ui_common/ui_common.dart';

import '../widgets/lighted_background.dart';
import '../widgets/page_indicators.dart';
import '../widgets/sm_home_bottom_navigation.dart';
import '../widgets/smart_room_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return LightedBackgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const ShAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text("SELECT A ROOM", style: context.bodyLarge),
              height32,
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    SmartRoomsPageView(controller: controller),
                    const Positioned.fill(
                      top: null,
                      child: Column(
                        children: [
                          PageIndicators(),
                          SmHomeBottomNavigationBar(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
