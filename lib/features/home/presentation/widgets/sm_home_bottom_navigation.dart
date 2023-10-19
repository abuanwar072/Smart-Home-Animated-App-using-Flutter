import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class SmHomeBottomNavigationBar extends StatelessWidget {
  const SmHomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.lock),
            ),
            label: 'UNLOCK',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.home),
            ),
            label: 'MAIN',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(SHIcons.settings),
            ),
            label: 'SETTINGS',
          ),
        ],
      ),
    );
  }
}
