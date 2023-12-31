import 'package:flutter/material.dart';
import 'package:portfolio_web/skills/skills_view.dart';

import '../utils/color_assets.dart';

class OutlineSkillsContainer extends StatelessWidget {
   const OutlineSkillsContainer({super.key, required this.index,  this.rowIndex = 0, this.isMobile = false});
  final int index;
  final int rowIndex;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ? index : (index*2) + rowIndex;
    final colors = ColourAssets.all;
    return Container(
      width: isMobile ?? false ? double.infinity : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: colors.elementAt(index % colors.length),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(skills.elementAt(parsedIndex), style: Theme.of(context).textTheme.headlineMedium,),
    );
  }
}
