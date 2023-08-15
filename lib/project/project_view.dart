import 'package:flutter/material.dart';
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_web/constants.dart';
import 'package:portfolio_web/project/project_item_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../components/desktop_view_builder.dart';
import '../components/mobile_view_builder.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/pay_plan_screenshot.png',
    title: 'Pay Plan',
    description:
        'Pay Plan is an wealth monitoring application with SMS read functionality for automating money transaction recording process, It also provides manual entry of cash only transactions.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
  ProjectItem(
    image: 'images/soil_irrigation_screenshot.png',
    title: 'Soil Irrigation System',
    description:
        'Iot based application for monitoring Soil humidity, temperature and moisture along with automatic as well as manual activation of water pump attached to the micro Controller.',
    technologies: [
      'Flutter',
      'Firebase',
      'C++',
      'Arduino',
    ],
  ),
  ProjectItem(
    image: 'images/todo_screenshot.png',
    title: 'Task Manager',
    description:
        'Todoey is a task management mobile app designed to help users effortlessly organize their daily tasks, With its intuitive interface and state managed by Provider. Todoey transforms the way users approach their responsibilities and tasks.',
    technologies: [
      'Flutter',
      'Firebase',
      'Provider',
    ],
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});
  static const title = 'Projects';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  const ProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: item),
                ),
              )
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}


class ProjectMobileView extends StatelessWidget {
  const ProjectMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [

        for (final item in kProjectItems) ProjectItemBody(item: item)
      ],
    );
  }
}
