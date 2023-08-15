import 'package:flutter/material.dart';
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_web/constants.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'headerBody.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: HeaderMobileView(),
      desktopView: HeaderDesktopView(),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return Container(
      height: 600,
      width: kInitWidth,
      child: Padding(
        padding: kScreenPadding,
        child: Row(
          children: [
            Expanded(child: HeaderBody()),
            Image.asset(
              'images/my_photo.png',
              height: isSmall ? imageWidth : 400,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(child: Image.asset('images/my_photo.png')),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
