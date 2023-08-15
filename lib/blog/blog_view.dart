import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_web/components/mobile_desktop_view_builder.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/webfeed.dart';

import '../components/desktop_view_builder.dart';
import '../components/mobile_view_builder.dart';
import 'blog_card.dart';

class BlogView extends StatelessWidget {
  static const title = 'Blog';

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (_) => getArticles(),
      initialData: null,
      child: MobileDesktopViewBuilder(
        mobileView: BlogMobileView(),
        desktopView: BlogDesktopView(),
      ),
    );
  }
}

class BlogDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(
      titleText: BlogView.title,
      children: [
        Row(
          children: [
            for (final article in articles)
              Expanded(
                  child: BlogCard(
                article: article,
                isMobile: false,
              ))
          ],
        )
      ],
    );
  }
}

class BlogMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();
    return MobileViewBuilder(
      titleText: BlogView.title,
      children: [
        for (final article in articles)
          BlogCard(
            article: article,
            isMobile: true,
          )
      ],
    );
  }
}

Future<List<RssItem>> getArticles() async {
  final url =
      'https://cors-anywhere.herokuapp.com/https://medium.com/feed/@muhamad_haris';
  final response = await http.get(Uri.parse(url));
  final parsedResponse = RssFeed.parse(response.body);
  final haveFlutterTag = (RssItem article) {
    return article.categories!.any((category) => category.value == 'flutter');
  };
  final flutterArticles =
      parsedResponse.items!.where(haveFlutterTag).take(2).toList();
  return flutterArticles;
}
