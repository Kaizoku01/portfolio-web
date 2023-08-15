import 'package:flutter/material.dart';
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_web/constants.dart';
import 'package:provider/provider.dart';
import '../portfolioView/portfolioView.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: NavigationBarMobileView(),
        desktopView: NavigationBarDesktopView());
  }
}

class NavigationBarDesktopView extends StatelessWidget {
  const NavigationBarDesktopView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Image.asset(
            'images/navbar_logo.png',
            height: 50,
          ),
          Spacer(),
          for (var item in navigationItems)
            NavigationBarItem(
              onPressed: (){
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut);
              },
              text: item.text,
            )
        ],
      ),
    );
  }
}

class NavigationBarMobileView extends StatelessWidget {
  const NavigationBarMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(
            'images/navbar_logo.png',
            height: 50,
          ),
          Spacer(),
          IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Icon(Icons.menu))
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Padding(
      padding: EdgeInsets.only(left: 64),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: isSmall ? 17 : 24),
        ),
      ),
    );
  }
}
