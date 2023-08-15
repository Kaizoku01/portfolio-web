import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/color_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    super.key,
    required this.experience,
    required this.index,
  });
  final ExperienceInfo experience;
  final int index;
  @override
  Widget build(BuildContext context) {
    final colors = ColourAssets.all;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            width: 3, color: colors.elementAt(index % colors.length)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textStyle(isBold: true),
          ),
          SizedBox(height: 10),
          Text(
            experience.timeline,
            style: textStyle(isGrey: true),
          ),
          SizedBox(height: 10),
          for (final item in experience.descriptions)
            Text(
              item,
              style: textStyle(),
            ),
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold = false, bool isGrey = false}) {
  return TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    color: isGrey ? Colors.grey : Colors.black,
  );
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> descriptions;

  ExperienceInfo({
    required this.company,
    required this.timeline,
    required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
    company: 'Flutter Developer Inter @ Vyam ',
    timeline: 'April 2022 - May 2022 ',
    descriptions: [
      '– implemented screens for multi application environment.\n\t\t\t(Vendor, User, Admin)',
      '– connected APIs to the frontend and UI improvements.',
    ],
  ),
  ExperienceInfo(
    company: 'Flutter Developer Inter @ ZealYug ',
    timeline: 'May 2023 - July 2023 ',
    descriptions: [
  '– Implemented 20+ functional screens.',
  '– Refactored previous code.',
    ],
  ),
  // ExperienceInfo(
  //   company: 'Full Stack Web Developement Coding Bootcamp @ AlphaCamp',
  //   timeline: 'August 2017 - October 2017 (3 months)',
  //   descriptions: [
  //     '- Built 5 projects in Ruby in Rails such as Twitter clone, Food Review website',
  //     '- Learnt HTML, CSS, Ruby, Ruby on Rails, JQuery, Javascript ',
  //     '- Led a team of 3 developers in final project',
  //   ],
  // ),
  // ExperienceInfo(
  //   company: 'Coding Instructor Volunteer @ Code in the Community',
  //   timeline: 'April 2018 - January 2020 (21 months)',
  //   descriptions: [
  //     '- Taught over 30 students in Python and Scratch programming',
  //     '- Mentored over 10 volunteers in teaching and coaching young students',
  //     '- Featured on local news on volunteering experience',
  //   ],
  // ),
];
