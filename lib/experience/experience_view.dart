import 'package:flutter/material.dart';
import 'package:portfolio_web/components/desktop_view_builder.dart';
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_web/experience/experience_container.dart';

import '../components/mobile_view_builder.dart';

class ExperienceView extends StatelessWidget {
  static const title = 'Experience';

  const ExperienceView({super.key});
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ExperienceMobileView(),
        desktopView: ExperienceDesktopView());
  }
}

class ExperienceDesktopView extends StatelessWidget {
  const ExperienceDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var rowIndex = 0;
                rowIndex < experiences.length/2;
                rowIndex++)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var index = 0; index < experiences.length; index++)
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: ExperienceContainer(
                          experience:
                              experiences.elementAt(rowIndex * 2 + index),
                          index: rowIndex * 2 + index,
                        ),
                      ),
                  ],
                ),
              )
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ExperienceView.title,
      children: [
        Column(
          children: [
            for (final experience in experiences)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ExperienceContainer(
                  experience: experience,
                  index: experiences.indexOf(experience),
                ),
              )
          ],
        )
      ],
    );
  }
}
