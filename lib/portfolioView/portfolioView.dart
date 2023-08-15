import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio_web/portfolioView/back_to_top_botton.dart';
import 'package:portfolio_web/project/project_view.dart';
import 'package:portfolio_web/skills/skills_view.dart';
import 'package:provider/provider.dart';
import '../Header/headerView.dart';
import '../drawer/drawer_view.dart';
import '../experience/experience_view.dart';
import '../footer/footer_view.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin{
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavigationItem> navigationItems = [];
  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );
  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('Projects', key: projectKey),
        NavigationItem('Skills', key: skillsKey),
        NavigationItem('Experiences', key: experienceKey),
        //NavigationItem('Blog', key: blogKey),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        endDrawer: DrawerView(),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              NavigationBarView(),
              HeaderView(),
              ProjectView(key: projectKey),
              SkillsView(key: skillsKey),
              ExperienceView(key: experienceKey),
              //BlogView(key: blogKey),
              FooterView(),
            ],
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem(this.text, {required this.key});

  double get position => _getPosition(key);
}
double _getPosition(GlobalKey key) {
  final renderBox = key.currentContext?.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}
