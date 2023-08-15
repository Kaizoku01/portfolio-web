

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/project/project_view.dart';

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({super.key, required this.item});
  final ProjectItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(item.image),
        SizedBox(height: 15),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 10),
        Text(
          item.description,
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Chip(
                  label: Text(tech),
                ),
              ),
            SizedBox(height: 50),
          ],
        )
      ],
    );
  }
}
