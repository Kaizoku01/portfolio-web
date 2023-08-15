import 'package:flutter/material.dart';

import '../constants.dart';

class MobileViewBuilder extends StatelessWidget {
  const MobileViewBuilder({super.key, required this.titleText, required this.children});
  final String titleText;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 3),
          SizedBox(height: 40),
          Text(titleText, style: Theme.of(context).textTheme.displayMedium),
          SizedBox(height: 40),
          ...children
        ],
      ),
    );
  }
}
