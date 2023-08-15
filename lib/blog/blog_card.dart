import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/hover_extension.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:intl/intl.dart';

import '../experience/experience_container.dart';
class BlogCard extends StatelessWidget {
  final bool isMobile;
  final RssItem article;

  BlogCard({super.key, required this.isMobile, required this.article});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => launchUrl(Uri.parse(article.link!)),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: isMobile ? 20 : 40),
              child: Text(
                article.title!,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    convertDate(article.pubDate.toString()),
                    style: textStyle(isGrey: true),
                  ),
                  SizedBox(height: 15),
                  Text(
                    removeAllHtmlTags(article.content!.value),
                    style: textStyle(),
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ).moveUpOnHover,
    );
  }
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

String convertDate(String dateText) {
  final date = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(dateText);
  return DateFormat('d MMMM yyyy').format(date);
}