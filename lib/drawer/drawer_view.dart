import 'package:flutter/material.dart';
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:provider/provider.dart';

import '../navigation_bar/navigation_bar_view.dart';
import '../portfolioView/portfolioView.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: DrawerMobileView(),
      desktopView: SizedBox(),
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Sarvagya Saxena'),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue],
                    tileMode: TileMode.repeated)),
          ),
          for (var item in navigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
                Navigator.pop(context);
              },
            )
        ],
      ),
    );
  }
}
